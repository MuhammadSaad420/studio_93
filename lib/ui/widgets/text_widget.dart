import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.title,
    this.size,
    this.weight,
    this.textColor,
  });

  final String title;
  final double? size;
  final FontWeight? weight;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: textColor,
      ),
    );
  }
}
