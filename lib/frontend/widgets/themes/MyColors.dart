//Packages
import 'package:flutter/material.dart';

class AppColors {
static const primaryColor = Color.fromRGBO(44,43,124,1);

  static const secondaryColor =Color.fromRGBO(6,98, 186,1);
 // static const primaryColor =Color(0xff416AB2);
  static const backgroundColor = Color.fromRGBO(243, 239, 228,1);
  static const bottomNavigationCurve = Colors.grey;
  static const red = Colors.red;
  static const white = Colors.white;
  static Color  lightGrey = Colors.grey.shade100;
  static const blue = Colors.blueAccent;
  static const blueObservationCard = Color.fromRGBO(0, 0, 255, 1);
  static const black = Colors.black;
  static const grey = Colors.grey;
  static const green = Colors.green;
  static const dropdownColor =  Color(0X95E9EBF0);
static const MaterialColor primaryMaterial = MaterialColor(
  0xff2c2a7d, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
  <int, Color>{
    50: Color(0xff282671),//10%
    100: Color(0xff232264),//20%
    200: Color(0xff1f1d58),//30%
    300: Color(0xff1a194b),//40%
    400: Color(0xff16153f),//50%
    500: Color(0xff121132),//60%
    600: Color(0xff0d0d25),//70%
    700: Color(0xff090819),//80%
    800: Color(0xff04040c),//90%
    900: Color(0xff000000),//100%
  },
);
}

