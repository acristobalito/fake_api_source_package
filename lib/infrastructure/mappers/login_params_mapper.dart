import 'package:fake_api_source_package/domain/model/login_params_model.dart';

/// Class used to map the **LoginParamsModel** to JSON.
class LoginParamsMapper {
  /// Returns a __Map<String, dynamic>__ data type.
  static Map<String, dynamic> loginParamsModelToJson(LoginParamsModel model) =>
      {"username": model.username, "password": model.password};
}
