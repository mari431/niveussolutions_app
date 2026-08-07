import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/themeController.dart';
import '../constance/globe_colors.dart';
final ThemeController _themeFindController = Get.find<ThemeController>();

class CustTextContainer extends StatelessWidget {
  final String text;

  const CustTextContainer({super.key, 
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.orange,
      // width: 100,
      margin: const EdgeInsets
          .fromLTRB(15, 0, 0, 0),
      child: Text(
        '$text :',
        style: TextStyle(
            fontSize: 12,color: GlobeAppColors.getHeadNamewhite70TextColor(_themeFindController.isDarkMode)),
      ),
    );
  }
}