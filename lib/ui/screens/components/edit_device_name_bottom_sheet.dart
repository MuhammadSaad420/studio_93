import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:studio_93/core/util/toast_util.dart';
import 'package:studio_93/models/product.dart';
import 'package:studio_93/ui/resources/app_string.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/main_button.dart';
import '../../widgets/text_field_widget.dart';

// ignore: must_be_immutable
class EditDeviceNameBottomSheet extends HookWidget {
  const EditDeviceNameBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final caloriesContoller = useTextEditingController();
    return Padding(
      padding: EdgeInsets.fromLTRB(
          15, 20, 15, MediaQuery.of(context).viewInsets.bottom + 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFieldWidget(
              controller: nameController, hint: AppStrings.hintEnterProduct),
          const Gap(5),
          TextFieldWidget(
            controller: caloriesContoller,
            hint: AppStrings.hintEnterCalories,
            keyboardType: TextInputType.number,
          ),
          const Gap(15),
          MainButton(
              title: AppStrings.add,
              onPressed: () {
                final name = nameController.value.text;
                final calories = int.tryParse(caloriesContoller.value.text);
                if (nameController.value.text.isEmpty) {
                  showError(message: AppStrings.msgPleaseFillFields);
                  return;
                }
                if (calories == null) {
                  showError(message: AppStrings.msgInvalidCalories);
                  return;
                }
                final product = Product(
                  id: const Uuid().v1(),
                  title: name,
                  calories: calories,
                );
                Navigator.of(context).pop(product);
              })
        ],
      ),
    );
  }

  showError({required String message}) {
    ToastUtil.show(message: message);
  }
}
