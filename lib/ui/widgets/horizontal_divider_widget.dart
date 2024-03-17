import 'package:flutter/material.dart';

class HorizontalDividerWidget extends StatelessWidget {
  const HorizontalDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.white,
      thickness: 1,
      height: 0,
    );
  }
}
