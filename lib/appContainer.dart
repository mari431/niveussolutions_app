import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/alert_controller.dart';
import 'Controller/themeController.dart';
import 'main.dart';

class AppContainer {
  static final AppContainer _instance = AppContainer._internal();

  factory AppContainer() {
    return _instance;
  }

  AppContainer._internal();

  Future<void> initialize() async {

    Get.lazyPut(()=>ThemeController());
    Get.lazyPut(()=>SuccessAlertController());
    Get.lazyPut(()=>AlertController());
    Get.lazyPut(()=>LoadingController());

    runApp(const MyApp());
  }
}
