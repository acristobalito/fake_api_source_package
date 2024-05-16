import 'package:fake_api_source_package/domain/model/rating_model.dart';

class RatingMapper {
  static Rating ratingFromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );
}
