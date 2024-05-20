import 'dart:convert';

import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:fake_api_source_package/infrastructure/mappers/rating_mapper.dart';

/// Class used to map the JSON response from the service to the **List<ProductModel>** model
class ProductMapper {
  /// Returns a [ProductModel] data type, receives a [Map] as an argument which represents a JSON that is used to map them to the model mentioned above.
  static ProductModel _productFromJson(Map<String, dynamic> json) =>
      ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: RatingMapper.ratingFromJson(json["rating"]),
      );

  /// Returns a **List<ProductModel>** data type.
  static List<ProductModel> productsFromJson(String response) =>
      List<ProductModel>.from(
          json.decode(response).map((x) => _productFromJson(x)));
}
