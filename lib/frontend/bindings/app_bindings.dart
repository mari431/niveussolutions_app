import 'package:get/get.dart';

import '../../Controller/alert_controller.dart';
import '../../Controller/auth_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => GeneralController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<SuccessAlertController>(() => SuccessAlertController());
    // Get.lazyPut(()=>SuccessAlertController());
  }
}

