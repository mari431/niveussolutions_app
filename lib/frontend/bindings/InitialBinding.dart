import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../controller/network_controller.dart';
import '../../controller/themeController.dart';



class InitialBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(AuthController());

    Get.put(ThemeController());

    Get.put(NetworkController(),
        permanent: true);
  }
}