import 'package:fake_api_source_package/domain/model/rating_model.dart';

/// Modelo empleado para almacenar los atributos de un producto que retorna el servicio.
///
/// Dentro de sus atributos se emplea el modelo **RatingModel** para almacenar las calificaciones del producto.
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
