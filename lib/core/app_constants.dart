import 'package:flutter/material.dart';
import 'package:studio_93/models/meal.dart';

class AppConstants {
  AppConstants._();

  static List<Meal> meals = [
    const Meal(
      title: "Meal One",
      listOfProducts: [],
      icon: Icons.fork_right_outlined,
    ),
    const Meal(
      title: "Meal Two",
      listOfProducts: [],
      icon: Icons.access_time,
    ),
    const Meal(
      title: "Meal Three",
      listOfProducts: [],
      icon: Icons.accessibility_sharp,
    ),
    const Meal(
      title: "Meal Four",
      listOfProducts: [],
      icon: Icons.cabin,
    ),
    const Meal(
      title: "Meal Five",
      listOfProducts: [],
      icon: Icons.table_restaurant,
    ),
    const Meal(
      title: "Meal Six",
      listOfProducts: [],
      icon: Icons.radio,
    ),
  ];
}
