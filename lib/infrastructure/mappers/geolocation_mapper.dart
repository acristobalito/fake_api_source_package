import 'package:fake_api_source_package/domain/model/geolocation_model.dart';

/// Class used to map the JSON service response to the **GeolocationModel** model.
class GeolocationMapper {
  /// Returns a __Map<String, dynamic>__ data type.
  static Map<String, dynamic> geolocationModelToJson(GeolocationModel model) =>
      {
        "lat": model.lat,
        "long": model.long,
      };
}
