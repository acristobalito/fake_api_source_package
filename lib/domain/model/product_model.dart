import 'package:fake_api_source_package/domain/model/rating_model.dart';

/// Model used to store the attributes of a product returned by the service.
///
/// Within its attributes, the **RatingModel** model is used to store the product ratings.
class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}
