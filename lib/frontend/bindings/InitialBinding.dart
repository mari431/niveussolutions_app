import 'package:get/get.dart';

import '../../Controller/auth_controller.dart';
import '../../Controller/network_controller.dart';
import '../../Controller/themeController.dart';



class InitialBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(AuthController());

    Get.put(ThemeController());

    Get.put(NetworkController(),
        permanent: true);
  }
}