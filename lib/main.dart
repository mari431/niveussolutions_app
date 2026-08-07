import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:niveussolutions/routes/routes.dart';

import 'Controller/auth_controller.dart';
import 'Controller/network_controller.dart';
import 'Controller/themeController.dart';
import 'appContainer.dart';
import 'frontend/screens/homePage.dart';
import 'frontend/widgets/NetworkWrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );
  // setUrlStrategy(PathUrlStrategy()); // Use PathUrlStrategy or
  Get.put(NetworkController(), permanent: true);
  AppContainer().initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  static AuthController get authPutController => Get.put(AuthController());


  @override
  void initState() {

    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      builder: (context, child) {
        return NetworkWrapper(
          child: child ?? const SizedBox(),
        );
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialBinding: BindingsBuilder(() {
        Get.put(ThemeController());
        Get.put(AuthController());

        Get.put(NetworkController(),
            permanent: true);
      }),

      // initialBinding : InitialBinding(),

      initialRoute: '/',

      getPages: [
        GetPage(
          name: '/',
          page: () => NiveHomeScreen()
        ),

        ...RoutesClass.routes,
      ],
    );
  }

}


