import 'package:fake_api_source_package/domain/model/rating_model.dart';

/// Clase empleada para mapear la respuesta del servicio JSON al modelo **RatingModel**
class RatingMapper {
  /// Retorna un tipo de dato [RatingModel].
  static RatingModel ratingFromJson(Map<String, dynamic> json) => RatingModel(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );
}
