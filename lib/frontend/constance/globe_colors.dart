import 'package:flutter/material.dart';

class GlobeAppColors {
  static const Color primaryColor = Color(0xFF00796B);
  static const Color secondaryColor = Color(0xFF64FFDA);
  static const Color accentColor = Color(0xFFFF5722);

  // static const Color textBlackColor = Color(0xFF333333);
  static const Color textBlackColor = Colors.black;
  static const Color textWhiteColor = Colors.white;
  static const Color backgroundColor = Color(0xFFF5F5F5);

  static Color getAppBarBGColor(bool isDarkMode) {
    return isDarkMode ? const Color(0x3B3B5B5B) : const Color(0xFF07296a);
  }

  static Color getBodyBGColor(bool isDarkMode) {
    return isDarkMode ? const Color(0xFF3A3A5A) : Colors.white;
  }

  static Color? getAlertDialogueBGColor(bool isDarkMode) {
    return isDarkMode ? const Color(0xFF3A3A5A) : null;
  }

  static Color getDrawerOpenCloseIconColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.white;
  }

  static Color getCompanyNametextColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.lightGreenAccent;
  }

  static Color getDrawerBGColor(bool isDarkMode) {
    return isDarkMode ? const Color(0xFF3A3A5A) : Colors.white;
  }

  static Color getDrawerSideBorderColor(bool isDarkMode) {
    return isDarkMode ? Colors.black : Colors.grey;
  }

  static Color getTextColor(bool isDarkMode) {
    return isDarkMode ? textWhiteColor : textBlackColor;
  }

  static Color getHelloTextColor(bool isDarkMode) {
    return isDarkMode ? textBlackColor : Colors.grey;
  }

  static Color getUserNameTextColor(bool isDarkMode) {
    return isDarkMode ? textBlackColor : textWhiteColor;
  }

  static Color getOneCharTextColor(bool isDarkMode) {
    return isDarkMode ? textWhiteColor : Colors.black;
  }

  static Color getHoriZantalLineColor(bool isDarkMode) {
    return isDarkMode ? textBlackColor : Colors.grey;
  }

  static Color getCloseIconColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.black;
  }

  static Color getDrawerListTileHeadTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.black;
  }

  static Color getDrawerListTileIconColor(bool isDarkMode) {
    return isDarkMode ? Colors.grey : Colors.grey;
  }



  static Color getDrawerListTileHeadExpandedTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.greenAccent : Colors.pink;
  }

  static Color getDrawerListTileSubHeadTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.black;
  }

  static Color getDrawerListTileSubHeadExpandedTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.greenAccent : Colors.pink;
  }

  static Color getDrawerListTileFormNameTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.black;
  }

  static Color? getCardBGColor(bool isDarkMode) {
    return isDarkMode ? const Color(0x4D4D6C6C) : Colors.white;
  }

  static Color getHeaderNameListCardBGColor(bool isDarkMode) {
    return isDarkMode ? const Color(0x4D4D6C6C) : Colors.black;
  }
  static Color? getArrayValueListCardBGColor(bool isDarkMode) {
    // return isDarkMode ? Color(0x5D5D9898) : Color(0);
    return isDarkMode ? const Color(0xFF3A3A5A)  : null;
  }

  static Color getWhiteTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.black;
  }
  static Color? getBGWhiteColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : null;
  }

  static Color? getBlack87BGColor(bool isDarkMode) {
    return isDarkMode ? Colors.black87 : null;
  }

  static Color? getHoverBGColor(bool isDarkMode) {
    return isDarkMode ? Colors.grey : null;
  }

  static Color getGreyTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.grey : Colors.grey;
  }

  static Color getHeadNamewhite70TextColor(bool isDarkMode) {
    return isDarkMode ? Colors.white70 : Colors.black;
  }

  static Color getTextEditingBGColor(bool isDarkMode) {
    return isDarkMode ? const Color(0xFF3A3A5A) : Colors.white;
  }

  static Color getBorderAllColor(bool isDarkMode) {
    return isDarkMode ? Colors.grey.shade300 : Colors.black;
  }

  static Color getProcessdataTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.lightBlue : Colors.indigo;
  }



// static Color getBackgroundColor(bool isDarkMode) {
//   return isDarkMode ? Color(0x3A3A5A) : backgroundColor;
// }
//
// static Color getTextColor(bool isDarkMode) {
//   return isDarkMode ? textWhiteColor : textBlackColor;
// }

// Add more methods for other colors as needed
}
