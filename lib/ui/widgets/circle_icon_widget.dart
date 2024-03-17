import 'package:flutter/material.dart';

class CircleIconWidget extends StatelessWidget {
  const CircleIconWidget({
    super.key,
    required this.icon,
    required this.bgColor,
  });

  final IconData icon;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: bgColor,
      child: Icon(
        icon,
        size: 13,
        color: Colors.white,
      ),
    );
  }
}
