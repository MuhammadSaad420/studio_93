import 'package:flutter/material.dart';
import 'package:studio_93/core/extensions.dart';
import 'package:studio_93/ui/resources/app_string.dart';

import '../../../models/product.dart';
import '../../widgets/product_item_widget.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.addedProducts,
    required this.editMode,
    this.onRemove,
  });

  final List<Product> addedProducts;
  final bool editMode;
  final ValueChanged<String>? onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <ProductItemWidget>[
        for (var product in addedProducts)
          ProductItemWidget(
            productID: product.id,
            title: product.title,
            calories: product.calories,
            editMode: editMode,
            onRemove: (productID) => onRemove!(productID),
          ),
        ProductItemWidget(
          title: AppStrings.total,
          calories: addedProducts.sumCalories(),
          isTotal: true,
        ),
      ],
    );
  }
}
