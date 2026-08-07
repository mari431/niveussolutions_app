import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niveussolutions/routes/routes.dart';

import 'Controller/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    final AuthController authController = Get.find();
    // String? token = authController.LoginJWTToken.value;
    // if (!authController.loggedIn.value && route != RoutesClass.login) {
    //   return RouteSettings(name: RoutesClass.login);
    // }
    return null;
  }
}