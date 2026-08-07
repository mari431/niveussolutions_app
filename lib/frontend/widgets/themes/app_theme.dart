//Packages
import 'package:flutter/material.dart';

import 'myColors.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: const Color.fromRGBO(192, 131, 7, 1),
  fontFamily: 'Plus Jakarta Sans',
  dialogTheme: const DialogThemeData(
    backgroundColor: Colors.green,
    shadowColor: Colors.red,
    surfaceTintColor: Colors.red
  )
  );
final unselectedColor=AppColors.primaryColor.withAlpha(70);
const checkColor=AppColors.secondaryColor;

const selectedItemsTextStyle= TextStyle(
    color: AppColors.white
);
const searchHintStyle=TextStyle (
    color: AppColors.secondaryColor
);
const itemsTextStyle= TextStyle(
    color: AppColors.primaryColor
);
const buttonIcon= Icon(Icons.arrow_drop_down,
  color: AppColors.primaryColor,);
  const buttonStyle=TextStyle(
  color: AppColors.primaryColor,
);
const textStyle=  TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16
);

const chipTextStyle=TextStyle(
    color: AppColors.white
);