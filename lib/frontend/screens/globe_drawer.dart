
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/themeController.dart';
import '../constance/globe_colors.dart';

class globe_drawer extends StatefulWidget {
  globe_drawer({super.key});

  final GlobalKey<FormState> _drawerFormKey = GlobalKey<FormState>();

  @override
  State<globe_drawer> createState() => _globe_drawerState();
}

class _globe_drawerState extends State<globe_drawer> {
  final GlobalKey _drawerscrollKey = GlobalKey();
  // final GlobeDrawerController _globeDrawerController = Get.put(GlobeDrawerController());
  // final GlobeDrawerController _globeDrawerFindController = Get.find<GlobeDrawerController>();
  final ThemeController _themeFindController = Get.find<ThemeController>();

  bool isMasterlistExpanded = false;
  bool isERPlistExpanded = false;
  bool isTransactionslistExpanded = false;
  bool ispurchaselistExpanded = false;
  bool isProductionlistExpanded = false;
  bool isStockslistExpanded = false;
  bool isSaleslistExpanded = false;
  bool isAccountlistExpanded = false;
  bool isCostingSheetlistExpanded = false;
  bool isPermissionlistExpanded = false;
  bool isKralistExpanded = false;
  // bool isAttendancelistExpanded = false;
  bool isExchangeRatelistExpanded = false;
  bool isReportsExpanded = false;
  bool isMasterReportsExpanded = false;
  bool isKRAReportsExpanded = false;
  bool isSalesReportsExpanded = false;
  bool isSalesTransExpanded = false;
  bool isPurchaseTransExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    // final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height - 5;
    final scrollController = ScrollController();


    return
      //Drawer start
      Obx(() =>   Drawer(
        backgroundColor: GlobeAppColors.getDrawerBGColor(_themeFindController.isDarkMode),
      elevation: 1.5,
      shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),

        side: BorderSide(
            color: GlobeAppColors.getDrawerSideBorderColor(_themeFindController.isDarkMode),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // UserAccountsDrawerHeader(
          //   // accountName: Text('Mari'),
          //   accountName: Text(UserName ?? ""),
          //   accountEmail: Text(UserEmail ?? ""),
          //   decoration: BoxDecoration(
          //     // color: const Color(0xFF00897b),
          //     color: Colors.green[300],
          //   ),
          //   currentAccountPicture: CircleAvatar(
          //     backgroundColor: Colors.white,
          //     child: Text(
          //       UserName == "" ? "" : UserName[0],
          //       style: TextStyle(fontSize: 25, color: Colors.green),
          //     ),
          //   ),
          //
          //   // otherAccountsPictures: [
          //   //   CircleAvatar(
          //   //     backgroundColor: Colors.white,
          //   //     child: Text('abc'),
          //   //     // backgroundImage: NetworkImage(
          //   //     //     'https://image.shutterstock.com/image-photo/old-brick-black-color-wall-260nw-1605128917.jpg'),
          //   //   )
          //   // ],
          // ),






    //       InkWell(
    //         onTap: () {
    //           // AuthController.to.logout();
    //           },
    //         onHover: (value) {
    //           setState(() {
    //             _globeDrawerController.isLogoutHovered = value;
    //           });
    //           // _globeDrawerController.isLogoutHovered = value;
    //         },
    //
    //         child: ListTile(
    //           tileColor: Colors.red,
    //           // focusColor: Colors.teal,
    //                       // onTap: () => callLogout(),
    //           // onTap: () => AuthController.to.logout(),
    // onTap: () => AuthController.to.showLogoutPopup(context),
    //           title: Text(
    //             'Log out',
    //             style: TextStyle(
    //                 fontSize: 11.0,
    //                 color: _globeDrawerController.isLogoutHovered ? Colors.black : Colors.white,
    //             ),
    //           ),
    //           contentPadding:
    //               const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
    //           dense: true,
    //           leading: Icon(Icons.logout, color: _globeDrawerController.isLogoutHovered ? Colors.black : Colors.white,),
    //         ),
    //       ),


          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text('version',
                // "Globe Version : 1.0.23( ${_globeDrawerController.applicationversionInfo ?? ''} )",
                // 'GTIL Version: ${_applicationInfo.version}',
                style: TextStyle(
                  fontSize: 9.0,
                  color: GlobeAppColors.getTextColor(_themeFindController.isDarkMode),
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    ),
      );
    //Drawer end
  }
}
