class ProductsModels {
  final dynamic id;
  final dynamic price;
  final String title;
  final String description;
  final String image;
  final RatingModel rating;
  final String category;
  ProductsModels({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.image,
    required this.rating,
    required this.category,
  });

  factory ProductsModels.fromJson(jsonData) {
    return ProductsModels(
      id: jsonData['id'],
      price: double.parse(jsonData['price'].toString()),
      title: jsonData['title'],
      description: jsonData['description'],
      image: jsonData['image'],
      rating: jsonData['rating'] != null
          ? RatingModel.fromJson(jsonData['rating'])
          : RatingModel(rate: 0.0, count: 0),
      category: jsonData['category'] ?? '',

    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] as num).toDouble(),
      count: jsonData['count'],
    );
  }
}
