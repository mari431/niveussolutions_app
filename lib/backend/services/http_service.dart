import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../exceptions/app_exceptions.dart';

class HttpHelper {
  Future<dynamic> get(String url, {bool auth = false}) async {
    Map<String, String> hd = await getHeaders(auth);

      // print("Api get URL:$url header:$hd");
    dynamic responseJson;
    try {
      try {
        final response = await http.get(Uri.parse(url), headers: hd);
        // print("test response : $response code :${response.statusCode}");
        responseJson = _returnResponse(response);
      } catch (e) {
          // print("web server error ");
         // Get.snackbar(
         //   'server error!',
         //   'No Internet Connection On Server!',
         //   backgroundColor: Colors.orange,
         //   colorText: Colors.black,
         // );
        throw FetchDataException('No Internet Connection', 500);
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection', 500);
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body, {bool auth = false, bool contentHeader = false}) async {

    Map<String, String> hd = await getHeaders(auth, contentHeader: contentHeader);
     // print("Api Post URL:$url header:$hd  body:$body");

    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: body, headers: hd);
      responseJson = _returnResponse(response);
      // print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet Connection', 500);
    }
    return responseJson;
  }

  getHeaders(auth, {bool  contentHeader= false}) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: "application/json",
      // HttpHeaders.acceptHeader: "multipart/form-data",
    };
    // Map<String, String> headers = {
    //   'Content-Type': 'multipart/form-data',
    // };


    if (contentHeader == true) {
      headers.addAll({
        HttpHeaders.contentTypeHeader: "application/json",
      });
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    if(auth) {
      if (token != null && token.isNotEmpty) {
        headers.addAll({
          HttpHeaders.authorizationHeader: "Bearer $token",
        });
      }
    }
    return headers;
  }

  dynamic _returnResponse(http.Response response) async {
    // print('response.statusCode:${response.statusCode}');
    // print('response.body:${response.body}:');

    // if (response.statusCode == 500 || response.statusCode == 502) {
    //   throw FetchDataException('${jsonDecode(response.body)['message']}', 500);
    // }
    // var responseBody = jsonDecode(response.body);

    // if (response.statusCode == 400 || response.statusCode == 401) {
    //   throw FetchDataException('${jsonDecode(response.body)['message']}', 400);
    // }

    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = response.body;
        return responseJson;
      case 400:
        var message = response.body;
        throw BadRequestException(message.toString(), response.statusCode);
        // var responseJson = response.body;
        // return responseJson;
      case 404:
        var message = "";
        throw BadRequestException(message.toString(), response.statusCode);
    //var responseJson = response.body;
    //return responseJson;
      case 401:
      case 403:
      //Utility.log('object');
        var message = "";
        throw UnauthorisedException("", message, response.statusCode);

        // break;
      case 422:
        var responseJson = response.body.toString();
        return responseJson;
      case 500:
      case 502:
        var errorMessage = json.decode(response.body)['message'] ?? '';
        throw FetchDataException(errorMessage, response.statusCode);
      default:
        var errorMessage = json.decode(response.body)['message'] ?? '';
        throw FetchDataException(errorMessage, 500);

      // case 502:
      //   throw FetchDataException('', 500);
      // case 500:
      //   throw FetchDataException('${json.decode(response.body)['message']}', 500);
      // default:
      //   throw FetchDataException('${json.decode(response.body)['message']}', 500);
    }
  }

  dynamic _returnResponsetest1(http.Response response) async {
    // print('response.statusCode:${response.statusCode}');
    // print('response.body:${response.body}:');

    // Common error handling logic
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = response.body;
        return responseJson;
      case 400:
      case 404:
        var message = response.body;
        throw BadRequestException(message.toString(), response.statusCode);
      case 401:
      case 403:
        throw UnauthorisedException("", "", response.statusCode);
      case 422:
        var responseJson = response.body.toString();
        return responseJson;
      case 500:
      case 502:
        var errorMessage = json.decode(response.body)['message'] ?? '';
        throw FetchDataException(errorMessage, response.statusCode);
      default:
        var errorMessage = json.decode(response.body)['message'] ?? '';
        throw FetchDataException(errorMessage, 500);
    }
  }

  // dynamic _returnResponse(http.Response response) async {
  //   // print('response.statusCode:${response.statusCode}');
  //   // print('response.body:${response.body}:');
  //
  //   String errorMessage;
  //   int statusCode = response.statusCode;
  //
  //   switch (statusCode) {
  //     case 200:
  //     case 201:
  //       return response.body;
  //     case 400:
  //     case 404:
  //       errorMessage = response.body;
  //       break;
  //     case 401:
  //     case 403:
  //       errorMessage = ""; // Set your custom error message here
  //       break;
  //     case 422:
  //       return response.body.toString();
  //     case 500:
  //     case 502:
  //       errorMessage = json.decode(response.body)['message'] ?? '';
  //       break;
  //     default:
  //       errorMessage = json.decode(response.body)['message'] ?? '';
  //       statusCode = 500; // Default status code
  //       break;
  //   }
  //
  //   if (errorMessage != null) {
  //     throw FetchDataException(errorMessage, statusCode);
  //   }
  // }

  Future<dynamic> put(String url, dynamic body, {bool auth = false, bool contentHeader = false}) async {
    Map<String, String> hd = await getHeaders(auth, contentHeader: contentHeader);

    // debugPrint('Api Put, url $url body : $body header :$hd');
    dynamic responseJson;
    try {
      final response = await http.put(Uri.parse(url), body: body, headers: hd);
      debugPrint("api response before decode  ${"$response"}");

      responseJson = returnResponse(response);
      debugPrint("api response ${"$responseJson"}");
      // Utility.log(responseJson);
    } on SocketException {
      // Utility.log('No net');
      throw FetchDataException('No Internet connection', 500);
    }
    // Utility.log('api post.');
    return responseJson;
  }

  Future<dynamic> delete(String url, dynamic body, {bool auth = false, bool contentHeader = false}) async {
    Map<String, String> hd = await getHeaders(auth, contentHeader: contentHeader);
    // debugPrint('Api Delete, url $url body : $body header :$hd');
    dynamic responseJson;
    try {
      final response = await http.delete(Uri.parse(url), body: body, headers: hd);
      debugPrint("api response before decode  ${"$response"}");

      responseJson = _returnResponse(response);
      // debugPrint("api response ${"$responseJson"}");
      // Utility.log(responseJson);
    } on SocketException {
      // Utility.log('No net');
      throw FetchDataException('No Internet connection', 500);
    }
    // Utility.log('api post.');
    return responseJson;
  }


  Future<dynamic> postddddddddddd(String url, dynamic body, {bool auth = false, bool contentHeader = false}) async {
    Map<String, String> hd = await getHeaders(auth, contentHeader: contentHeader);
    // print("Api Post URL:$url header:$hd  body:$body");
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: body, headers: hd);
      responseJson = _returnResponse(response);
      // print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet Connection', 500);
    }
    return responseJson;
  }


  returnResponse(http.Response response) async {
    //  var responseBody = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = response.body;
        return responseJson;
      case 400:
        var responseJson = response.body;
        return responseJson;
      case 404:
        // var message ="";
        throw BadRequestException(response.body.toString(), response.statusCode);
    //var responseJson = response.body;
    //return responseJson;
      case 401:
      case 403:
      //Utility.log('object');
        var message = "";

        throw UnauthorisedException("", message, response.statusCode,
            next: "");

        // break;
      case 422:
        var responseJson = response.body.toString();
        return responseJson;
      case 500:
      default:
        throw FetchDataException(
            '${json.decode(response.body)['message']}', 500);
    }
  }

  ///multipart start
  // Future<Response> multipart(
  //     String url, Map<String, dynamic> data, Map<String, File> files,
  //     {bool isImageUpload = false, auth = false}) async {
  //
  //   print("Api Post url $url");
  //
  //   ///1
  //   Map<String, MultipartFile> fileMap = {};
  //   ///1
  //
  //   ///2
  //   if (isImageUpload == true) {
  //     for (MapEntry fileEntry in files.entries) {
  //       File file = fileEntry.value;
  //       String fileName = file.path;
  //       fileMap[fileEntry.key] = MultipartFile(file.openRead(), await file.length(),filename: fileName);
  //     }
  //     print("check imageupload ${data.runtimeType}");
  //     data.addAll(fileMap);
  //   }
  //   ///2
  //
  //
  //   var formData = FormData.fromMap(data);
  //
  //   // Dio dio = Dio();
  //
  //   Map<String, dynamic> headers = {};
  //   if (auth == true) {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var token = prefs.getString("token");
  //     if (token != null && token.isNotEmpty) {
  //       headers.addAll(
  //         {
  //           HttpHeaders.authorizationHeader: "Bearer $token",
  //           HttpHeaders.acceptHeader: "application/json",
  //         },
  //       );
  //     }
  //   }
  //
  //   return await dio.post(
  //     url,
  //     data: formData,
  //     options: auth == true
  //         ? Options(contentType: 'multipart/form-data', headers: headers)
  //         : Options(
  //         contentType: 'multipart/form-data',
  //         followRedirects: false,
  //         validateStatus: (status) => true),
  //   );
  //
  //
  // }
///multipart end

}

