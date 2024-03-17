import 'package:flutter/material.dart';

import 'product.dart';

class Meal {
  final String title;
  final List<Product> listOfProducts;
  final IconData? icon;

  const Meal({required this.title, required this.listOfProducts, this.icon});

  Meal copyWith({
    String? title,
    List<Product>? listOfProducts,
  }) {
    return Meal(
        title: title ?? this.title,
        listOfProducts: listOfProducts ?? this.listOfProducts,
        icon: icon);
  }
}
