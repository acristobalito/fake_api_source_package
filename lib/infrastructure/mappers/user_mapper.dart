import 'package:fake_api_source_package/domain/model/user_model.dart';
import 'package:fake_api_source_package/infrastructure/mappers/address_mapper.dart';
import 'package:fake_api_source_package/infrastructure/mappers/name_mapper.dart';

/// Class used to map the JSON service response to the **UserModel** model.
class UserMapper {
  /// Returns a __Map<String, dynamic>__ data type.
  static Map<String, dynamic> nameModelToJson(UserModel model) => {
        "email": model.email,
        "username": model.username,
        "password": model.password,
        "name": NameMapper.nameModelToJson(model.name),
        "address": AddressMapper.addressModelToJson(model.address),
        "phone": model.phone,
      };
}
