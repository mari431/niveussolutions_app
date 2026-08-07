

import '../../controller/alert_controller.dart';
import 'package:get/get.dart';

AlertController get alertControllerto => Get.put(AlertController());

final AlertController _alertFindController = Get.find<AlertController>();

class AppException implements Exception{
  final dynamic _message;
  final dynamic _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  int code;
  String message;

  FetchDataException(this.message, this.code)
      : super(message, "") {
    // print("500 entry $message");
    if(code==500 || code==502) {
    /// 500 internal error screen
      //  Get.to(()=>Error500());
    }
    // Get.defaultDialog(
    //
    //      onConfirm: () {
    //        Get.offNamed('/');
    //      },
    //      onCancel: () {
    //        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    //      },
    //      textCancel: 'Close App',
    //      textConfirm: 'Home',
    //      middleText: message
    //  );

  }
}

class BadRequestException extends AppException {
  int code;
  String message;

  BadRequestException(this.message, this.code)
      : super(message, "Invalid Request: ") {
    // navigator!.pushNamed('/' + code.toString());
    // String scode = code != null ? code.toString() : '404';
   /// 404 not found screen
    // Get.to(()=>Error404());

    // navigator!.pushNamed('/' + code.toString());
    //  String scode = code != null ? code.toString() : '400';

    /// 400 bas Request
    //  final snackBar = SnackBar(
    //    content: Text('$message'),
    //    duration: Duration(seconds: 2),
    //  );

     // ScaffoldMessenger.of(context as BuildContext).showSnackBar(snackBar);

  }
}

class UnauthorisedException extends AppException {
  int code;
  String message;
  String next;
  var res;

  UnauthorisedException(this.res, this.message, this.code, {this.next = ""})
      // : super(message, "Your token is invalid: ") {
    : super(message, "Unauthorised: ") {
    // String scode = code != null ? code.toString() : '404';
    //navigator.pushNamed('/login');
    // Get.offAll(() => Login());
    // AuthController.to.logout();
    // _alertFindController.showAlert('Message', 'Your login token is Expired!'
    //     ' Please Login Again!');
    // Utility.log("next screen $next error $res");
    // LoginController.to.otpStatusFor.value="Login";

   /// 401unauthorized screen
    /*AlertBox.show(
        callback: () {
          Get.back();
        },
        title: 'Error ' + scode,
        message: Text(message));*/
  }
}
