import 'dart:convert';
import '../backend/services/api_services.dart';
import '../backend/services/http_service.dart';

class AuthRepository {
  static final HttpHelper httpHelper = HttpHelper();

  Future<dynamic> getAllDataSets() async {
    var url = Api.getAllDataSet;
    // print('url:$url');
    var response = await httpHelper.get(url, auth: true,);
    return jsonDecode(response);
  }

}


