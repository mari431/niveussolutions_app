import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:niveussolutions/controller/themeController.dart';
import 'package:get/get.dart';

import '../models/userModel.dart';
import '../frontend/screens/userDetailsDialog.dart';
import '../repository/auth_repository.dart';
import 'alert_controller.dart';

enum ApiStatus {
  initial,
  loading,
  success,
  empty,
  error,
}

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());
  final authrepository = AuthRepository();

  static SuccessAlertController get successto =>
      Get.put(SuccessAlertController());
  final AlertController _alertFindController = Get.find<AlertController>();
  final LoadingController loadingfingController = Get.find<LoadingController>();
  final ThemeController _themeFindController = Get.find<ThemeController>();


  var _isFullPageLoading = false.obs;

  get isFullPageLoading => _isFullPageLoading.value;

  set isFullPageLoading(value) {
    _isFullPageLoading.value = value;
  }

  var _dataLoading = false.obs;

  get dataLoading => _dataLoading.value;

  set dataLoading(value) {
    _dataLoading.value = value;
  }

  RxString selectedColumn = 'Name'.obs; // Track selected column
  RxBool isAscending = true.obs;

  RxList<UserModel> userList = <UserModel>[].obs;
  RxList<UserModel> filteredUserList = <UserModel>[].obs;
  TextEditingController searchController = TextEditingController();
  Rxn<UserModel> selectedUser = Rxn<UserModel>();
  final RxInt selectedUserIndex = (-1).obs;
  // final RxString selectedUserId = ''.obs;

  // final RxInt? selectedUserIndex = RxInt(-1);


  RxList<String> languageList = <String>[].obs;
  RxnString selectedLanguage = RxnString();

  Rx<ApiStatus> apiStatus = ApiStatus.initial.obs;
  RxString errorMessage = "".obs;


  @override
  void onInit() {
    super.onInit();
    initAuthLoadingFn();
  }


  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initAuthLoadingFn()async{
    isFullPageLoading = true;
    await getAllDataSet();
    isFullPageLoading = false;
  }


// Future<void>  getAllDataSet() async {
// try {
//   var res = await authrepository.getAllDataSets();
//   // final List<dynamic> data = jsonDecode(res);
//   final List<dynamic> data = res;
//   userList.value = data.map((e) => UserModel.fromJson(e)).toList();
// }catch(e){
//
// }
// }
    Future<void> getAllDataSet() async {

      apiStatus.value = ApiStatus.loading;
      errorMessage.value = "";

      const int maxRetry = 3;

      for (int attempt = 1; attempt <= maxRetry; attempt++) {
        try {
          final stopwatch = Stopwatch()..start();
          final res = await authrepository
              .getAllDataSets()
              .timeout(const Duration(seconds: 30));

          stopwatch.stop();

          print("API Time: ${stopwatch.elapsedMilliseconds} ms");

          // final bytes = utf8.encode(res).length;

          // print("Bytes : $bytes");
          // print("KB    : ${(bytes / 1024).toStringAsFixed(2)}");
          // print("MB    : ${(bytes / (1024 * 1024)).toStringAsFixed(2)}");
          // print("GB    : ${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)}");

          // Null response
          if (res == null) {
            apiStatus.value = ApiStatus.empty;
            errorMessage.value = "No response from server.";
            return;
          }

          // Empty response
          if (res is List && res.isEmpty) {
            userList.clear();
            filteredUserList.clear();
            apiStatus.value = ApiStatus.empty;
            errorMessage.value = "No records found.";
            return;
          }


          // Parse response
          userList.assignAll(
            (res as List).map((e) => UserModel.fromJson(e)).toList(),
          );
          // userList.assignAll([]);
          await prepareLanguages();
          // filteredUserList.assignAll(userList);


          apiStatus.value = ApiStatus.success;
          return;
        } on TimeoutException {
          if (attempt == maxRetry) {
            apiStatus.value = ApiStatus.error;
            errorMessage.value = "Request timed out.";
          }
        } on SocketException {
          apiStatus.value = ApiStatus.error;
          errorMessage.value = "No Internet connection.";
          return;
        } on FormatException {
          apiStatus.value = ApiStatus.error;
          errorMessage.value = "Invalid response received.";
          return;
        } catch (e) {
          if (attempt == maxRetry) {
            apiStatus.value = ApiStatus.error;
            errorMessage.value = e.toString();
          }
        }

        // Wait before retrying
        await Future.delayed(const Duration(seconds: 2));
      }
    }


  // Sort rows by a specific column

  void sortByColumn(String column) {
    filteredUserList.sort((a, b) {
      switch (column) {
        case 'Name':
          return isAscending.value
              ? a.name.toLowerCase().compareTo(b.name.toLowerCase())
              : b.name.toLowerCase().compareTo(a.name.toLowerCase());

        case 'Language':
          return isAscending.value
              ? a.language.toLowerCase().compareTo(b.language.toLowerCase())
              : b.language.toLowerCase().compareTo(a.language.toLowerCase());

        case 'ID':
          return isAscending.value
              ? a.id.toLowerCase().compareTo(b.id.toLowerCase())
              : b.id.toLowerCase().compareTo(a.id.toLowerCase());


        case 'Version':
          return isAscending.value
              ? a.version.compareTo(b.version)
              : b.version.compareTo(a.version);

        default:
          return 0;
      }
    });

    selectedColumn.value = column;
    isAscending.toggle();
    // userList.refresh();
    filteredUserList.refresh();
    selectedUserIndex.value = -1;
  }

  void sortByColumn1(String column) {


    // if (selectedColumn.value == column) {
    //   isAscending.toggle();
    // } else {
    //   selectedColumn.value = column;
    //   isAscending.value = true;
    // }

    if(isAscending.value){
      userList.sort((a, b) {
        switch (column) {
          case 'Name':
            return a.name.toLowerCase().compareTo(b.name.toLowerCase());

          case 'Language':
            return a.language.toLowerCase().compareTo(b.language.toLowerCase());

          case 'ID':
            return a.id.toLowerCase().compareTo(b.id.toLowerCase());

          case 'Version':
            return a.version.compareTo(b.version);

          default:
            return 0;
        }
      });
    }else{
      userList.sort((a, b) {
        switch (column) {
          case 'Name':
            return  b.name.toLowerCase().compareTo(a.name.toLowerCase());

          case 'Language':
            return b.language.toLowerCase().compareTo(a.language.toLowerCase());

          case 'ID':
            return b.id.toLowerCase().compareTo(a.id.toLowerCase());

          case 'Version':
            return b.version.compareTo(a.version);

          default:
            return 0;
        }
      });
    }


    selectedColumn.value = column;
    isAscending.toggle();
    userList.refresh();
    selectedUserIndex.value = -1;
  }

  void searchUser(String keyword) {
    keyword = keyword.trim().toLowerCase();

    if (keyword.isEmpty) {
      filteredUserList.assignAll(userList);
      return;
    }

    filteredUserList.assignAll(
      userList.where((user) {
        return user.name.toLowerCase().contains(keyword) ||
            user.id.toLowerCase().contains(keyword);
      }).toList(),
    );
  }

  Future<void> prepareLanguages() async{
    final languages = userList
        .map((e) => e.language)
        .where((e) => e.trim().isNotEmpty)
        .toSet()
        .toList();

    languages.sort();

    languageList.assignAll([
      "All Languages",
      ...languages,
    ]);

    filteredUserList.assignAll(userList);
  }

  void filterByLanguage(String? language) {
    selectedLanguage.value = language;

    if (language == null || language == "All Languages") {
      filteredUserList.assignAll(userList);
      return;
    }

    filteredUserList.assignAll(
      userList.where((e) => e.language == language).toList(),
    );
  }

  void applyFilters() {
    Iterable<UserModel> result = userList;

    if (selectedLanguage.value != null &&
        selectedLanguage.value != "All Languages") {
      result = result.where(
            (e) => e.language == selectedLanguage.value,
      );
    }

    final keyword = searchController.text.toLowerCase();

    if (keyword.isNotEmpty) {
      result = result.where((e) =>
      e.name.toLowerCase().contains(keyword) ||
          e.id.toLowerCase().contains(keyword));
    }

    filteredUserList.assignAll(result.toList());
  }


  Future<void> openUserDetails(UserModel user, int index)async {
    // selectedUserId.value = user.id.toString();
    selectedUser.value =  user;
    selectedUserIndex.value =  index;
    // selectedUserId.value = user.id.toString();
    // print('selectedUserIndex::${selectedUserIndex.value}');
    // selectedUserId.value = user.id.toString();

    // await Future.delayed(Duration(milliseconds: 200));
    Get.dialog(
      barrierDismissible: false,
      const UserDetailsDialog(),
      // barrierDismissible: true,
    );

  }


  }



class CompanyList {
  String selectedCompanyCode = "";
  String selectedCompanyName = "";

  CompanyList(
      {required this.selectedCompanyCode, required this.selectedCompanyName});
}
