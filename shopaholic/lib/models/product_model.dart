class Product {
  final String title;
  final String price;
  final String assetPath;
  final String? description;
  final bool isFav;

  Product({
    required this.title,
    required this.price,
    required this.assetPath,
     this.description,
     this.isFav = false
  });
}
