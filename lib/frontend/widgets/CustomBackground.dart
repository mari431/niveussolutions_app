import 'package:flutter/material.dart';

import 'custom_Clipper.dart';

class CustomBackground extends StatelessWidget {
  final Widget childName;

  const CustomBackground({super.key, required this.childName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // Your main content goes here
        // Center(
        //   child: Text(
        //     'Hello, Flutter!',
        //     style: TextStyle(fontSize: 24,color: Colors.white),
        //   ),
        // ),

        // Background with curves
        ClipPath(
          clipper: CurveClipper(),
          child: Container(
            color:const Color(0xFF3A3A5A,), // Set your desired background color
            child:childName,
          ),
          // Your main content
        ),
      ],
    );
  }
}