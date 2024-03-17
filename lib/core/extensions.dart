import 'package:studio_93/models/meal.dart';

import '../models/product.dart';

extension MealExtension on Meal {
  Meal removeProduct(String productId) {
    final updatedProducts =
        listOfProducts.where((product) => product.id != productId).toList();

    return Meal(
      title: title,
      listOfProducts: updatedProducts,
    );
  }

  Meal addProduct(Product product) {
    List<Product> existingProducts = [...listOfProducts, product];
    return copyWith(listOfProducts: existingProducts);
  }
}

extension ProductListExtension on List<Product> {
  int sumCalories() {
    int totalCalories = 0;
    for (Product product in this) {
      totalCalories += product.calories;
    }
    return totalCalories;
  }
}
