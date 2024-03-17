import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:studio_93/ui/resources/app_string.dart';
import 'package:studio_93/ui/widgets/text_widget.dart';

import '../../core/app_constants.dart';
import 'components/meal_item_widget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  title: AppStrings.meals,
                  weight: FontWeight.w700,
                  size: 22,
                ),
                Icon(Icons.more_horiz)
              ],
            ),
            const Gap(15),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    final currentItem = AppConstants.meals[index];
                    return MealItemWidget(
                      meal: currentItem,
                    );
                  },
                  separatorBuilder: (_, index) => const Gap(10),
                  itemCount: AppConstants.meals.length),
            ),
          ],
        ),
      ),
    ));
  }
}
