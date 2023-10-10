const String productTable = 'products';

class ProductFields {
  static final List<String> values = [id, count, title, description, price,imagePath];

  static const String id = '_id';
  static const String count = 'count';
  static const String title = 'title';
  static const String description = 'description';
  static const String price = 'price';
  static const String imagePath = 'imagepath';
}

class ProductModel {
  final int? id;

  final int count;
  final String title;
  final String description;
  final double price;
  final String imagePath;

  const ProductModel({
    this.id,
    required this.count,
    required this.title,
    required this.description,
    required this.price,
    required this.imagePath
  });

  ProductModel copy({
    int? id,
    bool? isImportant,
    int? count,
    String? title,
    String? description,
    double? price,
    String? imagePath,
  }) =>
      ProductModel(
        id: id ?? this.id,
        count: count ?? this.count,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        imagePath: imagePath ?? this.imagePath
      );

  static ProductModel fromJson(Map<String, Object?> json) => ProductModel(
        id: json[ProductFields.id] as int?,
        count: json[ProductFields.count] as int,
        title: json[ProductFields.title] as String,
        description: json[ProductFields.description] as String,
        price: json[ProductFields.price] as double,
        imagePath: json[ProductFields.imagePath] as String
      );

  Map<String, Object?> toJson() => {
        ProductFields.id: id,
        ProductFields.title: title,
        ProductFields.count: count,
        ProductFields.description: description,
        ProductFields.price: price,
        ProductFields.imagePath: imagePath
      };

  toMap() {}

  toLowerCase() {}

  static fromMap(x) {}
}
