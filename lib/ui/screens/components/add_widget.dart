import 'package:flutter/material.dart';
import 'package:studio_93/core/extensions.dart';
import 'package:studio_93/models/product.dart';

import '../../../models/meal.dart';
import 'edit_device_name_bottom_sheet.dart';

// ignore: must_be_immutable
class AddWidget extends StatelessWidget {
  AddWidget({
    super.key,
    required this.mealNotifier,
  });

  final ValueNotifier<Meal> mealNotifier;

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return InkWell(
      onTap: () => _showEditNameSheet(),
      child: Ink(
        width: 64,
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(7),
          ),
        ),
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  _showEditNameSheet() async {
    final product = await showModalBottomSheet<Product?>(
      context: _context,
      isScrollControlled: true,
      builder: (context) {
        return const EditDeviceNameBottomSheet();
      },
    );
    if (product != null) {
      mealNotifier.value = mealNotifier.value.addProduct(product);
    }
  }
}
