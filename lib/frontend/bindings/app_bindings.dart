import 'package:get/get.dart';

import '../../controller/alert_controller.dart';
import '../../controller/auth_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => GeneralController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<SuccessAlertController>(() => SuccessAlertController());
    // Get.lazyPut(()=>SuccessAlertController());
  }
}

