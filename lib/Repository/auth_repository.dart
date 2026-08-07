import 'dart:convert';


import '../backend/services/api_services.dart';
import '../backend/services/http_service.dart';


class AuthRepository {
  static final HttpHelper httpHelper = HttpHelper();

  Future<dynamic> getAllDataSets() async {
    var url = Api.getAllDataSet;
    print('url:$url');
    var response = await httpHelper.get(url, auth: true,);
    return jsonDecode(response);
  }

  // Future<dynamic> login({required dynamic body}) async {
  //   var response = await httpHelper.post(Api.login,body,auth:true,contentHeader: true);
  //    // debugPrint("login response $response");
  //     return jsonDecode(response);
  // }

  // Future<dynamic> flut_MobileNWebApplicationWiseLoginUserLog({required dynamic body}) async {
  //   var response = await httpHelper.post(Api.flut_MobileNWebApplicationWiseLoginUserLog, body,
  //       auth: true, contentHeader: true);
  //   // debugPrint("login response $response");
  //   // return json.decode(response);
  //   return jsonDecode(response);
  // }

  // Future<dynamic> getAllGroupListdata() async {
  //   var url = Api.getAllGroupListdata;
  //   var response = await httpHelper.get(url, auth: true,);
  //   return jsonDecode(response);
  // }

  // Future<dynamic> getAllSupplierListdataByActGRPID({required String PrmActGrpIDNumber}) async {
  //
  //   var url = "${Api.getAllSupplierListdataByActGRPID}/$PrmActGrpIDNumber";
  //   // var url = '${Api.getAllUsersByRefEmpCode}/\'$PrmRefUserId\'';  ///single Quotation
  //   var response = await httpHelper.get(url, auth: true,);
  //   // var response = await httpHelper.get(Api.getAllUsersByRefEmpCode,auth:true);
  //   // debugPrint("Get User by refcode Data response1 $response");
  //   // return json.decode(response);
  //   return jsonDecode(response);
  // }

  // Future<dynamic> getAllFormPermissionDataByUserID({required String PrmUserID}) async {
  //
  //   var url = "${Api.getAllFormPermissionDataByUserID}/$PrmUserID";
  //   // var url = '${Api.getAllUsersByRefEmpCode}/\'$PrmRefUserId\'';  ///single Quotation
  //   var response = await httpHelper.get(url, auth: true,);
  //   // var response = await httpHelper.get(Api.getAllUsersByRefEmpCode,auth:true);
  //   // debugPrint("Get User by refcode Data response1 $response");
  //   // return json.decode(response);
  //   return jsonDecode(response);
  // }

  // Future<dynamic> testlistenForChanges() async {
  //
  //   var url = Api.testlistenForChanges;
  //   // var url = '${Api.getAllUsersByRefEmpCode}/\'$PrmRefUserId\'';  ///single Quotation
  //   var response = await httpHelper.get(url, auth: true,);
  //   // var response = await httpHelper.get(Api.getAllUsersByRefEmpCode,auth:true);
  //   // debugPrint("Get User by refcode Data response1 $response");
  //   // return json.decode(response);
  //   return jsonDecode(response);
  // }

  // Future<dynamic> getAllCompanyNameListByUserWise({required dynamic body}) async {
  //   var response = await httpHelper.post(Api.getAllCompanyNameListByUserWise,body,auth:true,contentHeader: true);
  //   return jsonDecode(response);
  // }

  // Future<dynamic> getAllYear({required dynamic body}) async {
  //   var response = await httpHelper.get(Api.getAllYear,auth:true,);
  //   return jsonDecode(response);
  // }

}


