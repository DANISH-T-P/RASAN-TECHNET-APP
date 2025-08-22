class ProductModel {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;
  final int interestsShown;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
    required this.interestsShown,
    required this.category,
  });
}

