import 'package:flutter/material.dart';
import 'package:get/get.dart';

///---back button widget start
class CustomBackButton extends StatelessWidget {
  final String text;
  // final VoidCallback onPressed;
  //
  // const CustomBackButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  const CustomBackButton({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: onPressed,
    //   child: Text(text,style: const TextStyle(color: Colors.black)),
    // );

    return GestureDetector(
      onTap: () {
        Get.back();
      }, child: Container(
      // width: 70,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius:
        BorderRadius.circular(12),
        border: Border.all(
            width: 1.0,
            color: Colors.white),
      ),
      child: Center(
        heightFactor: 0.30,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight
                .bold,
            fontSize: 12,
          ),
        ),
      ),
    ),
    );
  }
}
///---back button widget end


class SaveButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SaveButton({super.key, 
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        side: const BorderSide(color: Colors.black), // Set the default background color
      ),
      child: Text(text,),
    );
  }
}



class CustTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? bgColor;
  final Color? textColor;
  final IconData? icon; // Optional icon
  final Color? iconColor;
  final double? iconSize;

  const CustTextButton({super.key, 
    required this.text,
    required this.onPressed,
    this.bgColor,
    this.textColor,
    this.icon,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: bgColor ?? Colors.white,
        side:  BorderSide(color: Colors.grey.shade100), // Set the default background color
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: iconColor ?? textColor ?? Colors.black,
              size: iconSize ?? 15.0,
            ),
            const SizedBox(width: 8),
          ],
          Text(text,style: TextStyle(color: textColor ?? Colors.black),),
        ],
      ),
    );
  }
}