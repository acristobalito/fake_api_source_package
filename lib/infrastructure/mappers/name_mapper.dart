import 'package:fake_api_source_package/domain/model/name_model.dart';

/// Class used to map the JSON service response to the **NameModel** model.
class NameMapper {
  /// Returns a __Map<String, dynamic>__ data type.
  static Map<String, dynamic> nameModelToJson(NameModel model) => {
        "firstname": model.firstname,
        "lastname": model.lastname,
      };
}
