import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity connectivity = Connectivity();

  RxBool isConnected = true.obs;

  bool _previousStatus = true;

  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  void onInit() {
    super.onInit();

    _initConnectivity();

    _subscription = connectivity.onConnectivityChanged.listen(
      updateConnection,
    );
  }

  Future<void> _initConnectivity() async {
    final result = await connectivity.checkConnectivity();
    updateConnection(result);
  }

  void updateConnection(List<ConnectivityResult> result) {
    bool connected =
        result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.ethernet);

    isConnected.value = connected;

    // Only show when status changes
    if (_previousStatus != connected) {
      if (connected) {
        Get.snackbar(
          "Internet",
          "Back Online",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(10),
          borderRadius: 10,
          duration: const Duration(seconds: 2),
          titleText: const SizedBox.shrink(), // hide title

        );
      } else {
        Get.snackbar(
          "Internet",
          "No Internet Connection",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(10),
          borderRadius: 10,
          duration: const Duration(seconds: 2),
          titleText: const SizedBox.shrink(), // hide title
        );
      }

      _previousStatus = connected;
    }
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}





// import 'dart:async';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class NetworkController extends GetxController {
//   final Connectivity _connectivity = Connectivity();
//
//   RxBool isConnected = false.obs;
//
//   late StreamSubscription<List<ConnectivityResult>>
//   _connectivitySubscription;
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     _checkInitialConnection();
//
//     _connectivitySubscription =
//         _connectivity.onConnectivityChanged.listen(
//           _updateConnectionStatus,
//         );
//   }
//
//   Future<void> _checkInitialConnection() async {
//     final result = await _connectivity.checkConnectivity();
//     _updateConnectionStatus(result);
//   }
//
//   void _updateConnectionStatus(List<ConnectivityResult> result) {
//     bool connected =
//         result.contains(ConnectivityResult.mobile) ||
//             result.contains(ConnectivityResult.wifi) ||
//             result.contains(ConnectivityResult.ethernet);
//
//     isConnected.value = connected;
//
//     if (connected) {
//       Get.closeAllSnackbars();
//
//       Get.snackbar(
//         "Internet",
//         "Back Online",
//         backgroundColor: Colors.green,
//         colorText: Colors.white,
//         snackPosition: SnackPosition.BOTTOM,
//         duration: const Duration(seconds: 1),
//       );
//     } else {
//       Get.closeAllSnackbars();
//
//       Get.snackbar(
//         "Internet",
//         "No Internet Connection",
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//         snackPosition: SnackPosition.BOTTOM,
//         duration: const Duration(days: 365),
//       );
//     }
//   }
//
//   @override
//   void onClose() {
//     _connectivitySubscription.cancel();
//     super.onClose();
//   }
// }