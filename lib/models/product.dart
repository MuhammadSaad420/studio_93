class Product {
  final String id;
  final String title;
  final int calories;

  Product({
    required this.id,
    required this.title,
    required this.calories,
  });

  Product copyWith({
    String? id,
    String? title,
    int? calories,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      calories: calories ?? this.calories,
    );
  }
}
