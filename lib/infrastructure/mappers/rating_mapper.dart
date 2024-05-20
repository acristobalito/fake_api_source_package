import 'package:fake_api_source_package/domain/model/rating_model.dart';

/// Class used to map the JSON service response to the **RatingModel** model
class RatingMapper {
  /// Returns a [RatingModel] data type.
  static RatingModel ratingFromJson(Map<String, dynamic> json) => RatingModel(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );
}
