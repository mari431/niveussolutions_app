import 'package:get/get.dart';

import '../frontend/bindings/app_bindings.dart';
import '../frontend/screens/HomePage.dart';
import '../frontend/screens/NiveHomeScreen.dart';


class RoutesClass {
  // static String login = "/globe/login";
  static String globeHome = "/globe";

  // static String GetLoginRoute() => login;
  static String GetGlobeHomeRoute() => globeHome;


  static List<GetPage> routes = [

    GetPage(
      name: globeHome,
      page: () => NiveHomeScreen(),
      binding: HomeScreenBinding()
      // bindings: [
      //   ProductionFormsBinding()
      // ]
      // title: 'TEST Enterprises',
      // transition: Transition.circularReveal,
      // transitionDuration: const Duration(seconds: 1)
    ),

    // GetPage(
    //   name: updateRatesAfterAssigningForm,
    //   page: () => UpdateRatesAfterAssigningForm(),
    //   binding: ProductionFormsBinding(),
    //   title: 'TEST Enterprises',
    //   // bindings: [
    //   //   ProductionFormsBinding()
    //   // ]
    //   // transition: Transition.fade,
    //   // transitionDuration: const Duration(seconds: 1)
    // ),





  ];
}
