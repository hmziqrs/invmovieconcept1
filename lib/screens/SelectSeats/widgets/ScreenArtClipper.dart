import 'package:flutter/material.dart';

class ScreenArtClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final heightO = size.height * 0.3;

    final path = Path();
    path.moveTo(0.0, heightO);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * -0.2,
      size.width,
      heightO,
    );

    // path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    // path.lineTo(0.0, size.size.height);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.45,
      0.0,
      size.height,
    );
    // path.lineTo(0.0, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // returning fixed 'true' value here for simplicity, it's not the part of actual question, please read docs if you want to dig into it
    // basically that means that clipping will be redrawn on any changes
    return true;
  }
}
