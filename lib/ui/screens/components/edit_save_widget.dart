import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../resources/app_string.dart';
import '../../widgets/text_widget.dart';

class EditSaveWidget extends StatelessWidget {
  const EditSaveWidget({
    super.key,
    required this.onEdit,
    required this.editMode,
    required this.onSave,
  });
  final bool editMode;
  final VoidCallback onEdit;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return !editMode
        ? Row(
            children: [
              GestureDetector(
                onTap: onEdit,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: const TextWidget(title: AppStrings.edit),
                ),
              ),
              const Gap(5),
              const Icon(Icons.save)
            ],
          )
        : GestureDetector(
            onTap: onSave,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.green,
                ),
              ),
              child: const TextWidget(
                title: AppStrings.save,
                textColor: Colors.green,
              ),
            ),
          );
  }
}
