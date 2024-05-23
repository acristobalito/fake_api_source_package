import 'dart:convert';

import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:http/http.dart' as http;

/// Clase que implementa [UserRepository] hereda el mixim [FakeApi].
class UserRepositoryImpl with FakeApi implements UserRepository {
  /// Retorna un [Future] de tipo [Either] que contiene como valor left [ResponseError]
  /// y right [String]. Estos valores son asignados dependiendo de la respuesta
  /// del servicio.
  @override
  Future<Either<ResponseError, String>> loginUser(
      LoginParamsModel loginParams) async {
    final url = getLoginUrl();
    final response = await http.post(Uri.parse(url),
        body:
            json.encode(LoginParamsMapper.loginParamsModelToJson(loginParams)),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return right(json.decode(response.body)["token"]);
    } else {
      return left(ResponseError('Ops!, ha ocurrido un error'));
    }
  }

  /// Retorna un [Future] de tipo [Either] que contiene como valor left [ResponseError]
  /// y right [UserModel]. Estos valores son asignados dependiendo de la respuesta
  /// del servicio.
  @override
  Future<Either<ResponseError, int>> registerUser(UserModel user) async {
    final url = getRegisterUrl();
    final response = await http.post(Uri.parse(url),
        body: json.encode(UserMapper.nameModelToJson(user)));

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return right(json.decode(response.body)["id"]);
    } else {
      return left(ResponseError('Ops!, ha ocurrido un error'));
    }
  }
}
