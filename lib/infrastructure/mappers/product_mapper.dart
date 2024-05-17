import 'dart:convert';

import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:fake_api_source_package/infrastructure/mappers/rating_mapper.dart';

/// Clase empleada para mapear la respuesta JSON del servicio al modelo **List<ProductModel>**
class ProductMapper {
  /// Retorna un tipo de dato [ProductModel], recibe como argumento un [Map] el cual representa
  /// un JSON que emplea para mapearlos al modelo mencionado anteriormente.
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

  /// Retorna un tipo de dato **List<ProductModel>**.
  static List<ProductModel> productsFromJson(String response) =>
      List<ProductModel>.from(
          json.decode(response).map((x) => _productFromJson(x)));
}
