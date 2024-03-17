import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:studio_93/core/extensions.dart';
import 'package:studio_93/ui/resources/app_string.dart';
import 'package:studio_93/ui/ui_helper/ui_extension.dart';

import '../../../models/meal.dart';
import '../../resources/app_colors.dart';
import '../../ui_helper/custom_container_clipper.dart';
import '../../widgets/text_widget.dart';
import 'add_widget.dart';
import 'edit_save_widget.dart';
import 'product_widget.dart';

class MealItemWidget extends HookWidget {
  const MealItemWidget({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final mealNotifier = useState<Meal>(meal);
    final editModeNotifier = useState(false);
    return Stack(
      key: UniqueKey(),
      children: [
        ClipPath(
          clipper: CustomContainerClipper(),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.orangeColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Icon(meal.icon),
                      ),
                    ),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          title: mealNotifier.value.title,
                          size: 20,
                          weight: FontWeight.w600,
                        ),
                        const Gap(10),
                        mealNotifier.value.listOfProducts.isNotEmpty
                            ? EditSaveWidget(
                                editMode: editModeNotifier.value,
                                onEdit: () => editModeNotifier.value = true,
                                onSave: () => editModeNotifier.value = false,
                              )
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.darkGreyColor),
                                child: const TextWidget(
                                  title: AppStrings.noProducts,
                                  textColor: Colors.white,
                                  size: 12,
                                ),
                              )
                      ],
                    )
                  ],
                ),
                if (mealNotifier.value.listOfProducts.isNotEmpty)
                  ProductWidget(
                    addedProducts: mealNotifier.value.listOfProducts,
                    editMode: editModeNotifier.value,
                    onRemove: (productID) {
                      mealNotifier.value =
                          mealNotifier.value.removeProduct(productID);
                    },
                  ).withProductListDecoration()
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: AddWidget(
            mealNotifier: mealNotifier,
          ),
        )
      ],
    );
  }
}
