import 'package:flutter/material.dart';
import 'package:studio_93/ui/widgets/horizontal_divider_widget.dart';

import '../resources/app_colors.dart';
import 'circle_icon_widget.dart';
import 'text_widget.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    this.productID,
    required this.title,
    required this.calories,
    this.isTotal = false,
    this.editMode = false,
    this.onRemove,
  });
  final String? productID;
  final String title;
  final int calories;
  final bool isTotal;
  final bool editMode;
  final ValueChanged<String>? onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                flex: 9,
                child: TextWidget(
                  title: title,
                  size: 17,
                  textColor: isTotal ? Colors.green : AppColors.greyColor,
                  weight: FontWeight.w500,
                ),
              ),
              Expanded(
                flex: 3,
                child: TextWidget(
                  title: "${calories.round()} Cals",
                  size: 15,
                  weight: FontWeight.w500,
                  textColor: isTotal ? Colors.green : null,
                ),
              ),
              Expanded(
                flex: 1,
                child: isTotal
                    ? const SizedBox()
                    : editMode
                        ? GestureDetector(
                            onTap: () => onRemove!(productID!),
                            child: const CircleIconWidget(
                              icon: Icons.close,
                              bgColor: Colors.red,
                            ),
                          )
                        : const CircleIconWidget(
                            icon: Icons.arrow_forward,
                            bgColor: Colors.black,
                          ),
              )
            ],
          ),
        ),
        const HorizontalDividerWidget()
      ],
    );
  }
}
