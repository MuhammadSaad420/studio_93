import 'package:flutter/material.dart';

class CustomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double cornerRadius = 12.0;
    double rightPadding = 70;
    double bottomMargin = 85;
    path.moveTo(cornerRadius, 0);
    path.lineTo((size.width - rightPadding) - cornerRadius, 0);
    path.quadraticBezierTo(
        size.width - rightPadding, 0, size.width - rightPadding, cornerRadius);
    path.lineTo(size.width - rightPadding, (bottomMargin) - cornerRadius);
    path.quadraticBezierTo(size.width - rightPadding, bottomMargin,
        (size.width - rightPadding) + 10, bottomMargin);
    path.lineTo(size.width - cornerRadius, bottomMargin);
    path.quadraticBezierTo(
        size.width, bottomMargin, size.width, bottomMargin + 10);
    path.lineTo(size.width, size.height - cornerRadius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - cornerRadius, size.height);
    path.lineTo(cornerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);
    path.lineTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
