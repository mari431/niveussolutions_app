import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.put(ThemeController());
  // RxBool isDarkMode = false.obs;
  final _isDarkMode = false.obs;
  get isDarkMode => _isDarkMode.value;
  set isDarkMode(value) {
    _isDarkMode.value = value;
  }

  @override
  void onInit() {
    // isDarkMode=ThemeController.to.isDarkMode;
    super.onInit();

  }

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    // isDarkMode = true;
  }



}