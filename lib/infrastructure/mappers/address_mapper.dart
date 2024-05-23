import 'package:fake_api_source_package/domain/model/address_model.dart';
import 'package:fake_api_source_package/infrastructure/mappers/geolocation_mapper.dart';

/// Class used to map the JSON service response to the **AddressModel** model.
class AddressMapper {
  /// Returns a __Map<String, dynamic>__ data type.
  static Map<String, dynamic> addressModelToJson(AddressModel model) => {
        "city": model.city,
        "street": model.street,
        "number": model.number,
        "zipcode": model.zipcode,
        "geolocation":
            GeolocationMapper.geolocationModelToJson(model.geolocation),
      };
}
