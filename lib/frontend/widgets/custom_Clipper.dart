
import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.8); // Start from the top-left corner

    // Define your curves or shapes here
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height * 0.8,
    );


    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.6,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0); // Finish at the top-right corner
    path.close(); // Close the path to create a closed shape

    // path.quadraticBezierTo(
    //   size.width * 0.25,
    //   size.height,
    //   size.width * 0.5,
    //   size.height * 0.8,
    // );


    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}