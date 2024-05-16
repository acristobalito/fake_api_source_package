import 'dart:convert';

import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:fake_api_source_package/infrastructure/mappers/rating_mapper.dart';

class ProductMapper {
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
  static List<ProductModel> productsFromJson(String response) =>
      List<ProductModel>.from(
          json.decode(response).map((x) => _productFromJson(x)));
}
