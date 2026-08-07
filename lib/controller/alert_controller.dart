
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:niveussolutions/Controller/themeController.dart';
import '../frontend/constance/globe_colors.dart';

final ThemeController _themeFindController = Get.find<ThemeController>();

class AlertController extends GetxController {

  void showAlert(String title, String message) {
    Get.dialog(
      barrierDismissible: false, // Set to false to prevent dismissing on outside tap
      AlertDialog(
        backgroundColor: GlobeAppColors.getAlertDialogueBGColor(_themeFindController.isDarkMode),
        title: Row(
          children: [
            const Icon(Icons.info_outline,color: Colors.orangeAccent,), // Replace Icons.info_outline with your desired icon
            const SizedBox(width: 8), // Optional spacing between icon and title text
            Text(title,style: TextStyle(color:  GlobeAppColors.getWhiteTextColor(_themeFindController.isDarkMode))),
          ],
        ),
        // content: Text(message),
        content: KeyboardListener(
          focusNode: FocusNode(),
          autofocus: true,
          onKeyEvent: (event) {
            // print('pe');
            if (event.logicalKey == LogicalKeyboardKey.enter || event.logicalKey == LogicalKeyboardKey.numpadEnter) {
              // When the Enter key is pressed, close the alert box
              Get.back();
            }
          },
          child: Text(message,style: TextStyle(color: GlobeAppColors.getWhiteTextColor(_themeFindController.isDarkMode)),),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}

class SuccessAlertController extends GetxController {
  void showAlert(String title, String message) {
    Get.dialog(
      barrierDismissible: false, // Set to false to prevent dismissing on outside tap
      AlertDialog(
        backgroundColor: GlobeAppColors.getAlertDialogueBGColor(_themeFindController.isDarkMode),
        title: Row(
          children: [
            const Icon(Icons.check_circle,color: Colors.green), // Replace Icons.info_outline with your desired icon
            const SizedBox(width: 8), // Optional spacing between icon and title text
            Text(title,style: const TextStyle(color: Colors.green),),
          ],
        ),
        // content: Text(message),
        content: KeyboardListener(
          focusNode: FocusNode(),
          autofocus: true,
          onKeyEvent: (event) {
            // print('pe');
            if (event.logicalKey == LogicalKeyboardKey.enter || event.logicalKey == LogicalKeyboardKey.numpadEnter) {
              // When the Enter key is pressed, close the alert box
              Get.back();
            }
          },
          child: Text(message,style: TextStyle(color: GlobeAppColors.getWhiteTextColor(_themeFindController.isDarkMode)),),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}

class FailAlertController extends GetxController {
  void showAlert(String title, String message) {
    Get.dialog(
      barrierDismissible: false, // Set to false to prevent dismissing on outside tap
      AlertDialog(
        backgroundColor: GlobeAppColors.getAlertDialogueBGColor(_themeFindController.isDarkMode),
        title: Row(
          children: [
            const Icon(Icons.close,color: Colors.orangeAccent,), // Replace Icons.info_outline with your desired icon
            const SizedBox(width: 8), // Optional spacing between icon and title text
            Text(title,style: TextStyle(color: GlobeAppColors.getWhiteTextColor(_themeFindController.isDarkMode))),
          ],
        ),
        // content: Text(message),
        content: KeyboardListener(
          focusNode: FocusNode(),
          autofocus: true,
          onKeyEvent: (event) {
            // print('pe');
            if (event.logicalKey == LogicalKeyboardKey.enter || event.logicalKey == LogicalKeyboardKey.numpadEnter) {
              // When the Enter key is pressed, close the alert box
              Get.back();
            }
          },
          child: Text(message,style: TextStyle(color: GlobeAppColors.getWhiteTextColor(_themeFindController.isDarkMode)),),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}


// class LoadingController extends GetxController {
//   void showLoading(String message) {
//     Get.dialog(
//       barrierDismissible: false, // Set to false to prevent dismissing on outside tap
//       builder: (context) => AlertDialog(
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CircularProgressIndicator(),
//             SizedBox(height: 16),
//             Text(message),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void hideLoading() {
//     Get.back();
//   }
// }



class LoadingController extends GetxController {
  static LoadingController get to => Get.put(LoadingController());
  void showLoading(bool show, String message) {
    if (show) {
      Get.dialog(
        barrierDismissible: false, // Set to false to prevent dismissing on outside tap
        AlertDialog(
          backgroundColor: GlobeAppColors.getAlertDialogueBGColor(_themeFindController.isDarkMode),
          // title: Row(
          // ),
          // content: Text(message),
          content: SizedBox(
            height: 100,
            width: 250,
            child: Center(
              child: Column(
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 5),
                  Text(message,style: TextStyle(color: GlobeAppColors.getWhiteTextColor(_themeFindController.isDarkMode))),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      Get.back();
    }
  }
}




// class LoadingTimerController extends GetxController {
//   void showTimer(bool show, String message) {
//     if (show) {
//       Timer.periodic(Duration(seconds: 1), (timer)
//       {
//         Get.dialog(
//           barrierDismissible: false,
//           // Set to false to prevent dismissing on outside tap
//           AlertDialog(
//             backgroundColor: GlobeAppColors.getAlertDialogueBGColor(
//                 _themeFindController.isDarkMode),
//              // title: Text("Loop Alert"),
//             // content: Text(message),
//             content: Container(
//               height: 100,
//               width: 250,
//               child: Center(
//                 child: Column(
//                   children: [
//                     CircularProgressIndicator(),
//                     SizedBox(height: 5),
//                     Text(message, style: TextStyle(
//                         color: GlobeAppColors.getWhiteTextColor(
//                             _themeFindController.isDarkMode))),
//                   ],
//                 ),
//               ),
//             ),
//             actions: [
//               TextButton(
//                 child: Text("Cancel"),
//                 onPressed: () {
//                   timer.cancel(); // Stop the timer
//                   Get.back();
//                 },
//               ),
//             ],
//           ),
//         );
//       });
//     } else {
//       Get.back();
//     }
//   }
// }


