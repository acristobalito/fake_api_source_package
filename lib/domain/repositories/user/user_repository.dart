import 'package:dartz/dartz.dart';
import 'package:fake_api_source_package/domain/model/login_params_model.dart';
import 'package:fake_api_source_package/domain/model/user_model.dart';
import 'package:fake_api_source_package/infrastructure/errors/response_error.dart';

/// Interface that exposes the repository methods:
/// * registerUser(UserModel user)
/// * loginUser(LoginParamsModel loginParams)
abstract interface class UserRepository {
  Future<Either<ResponseError, int>> registerUser(UserModel user);
  Future<Either<ResponseError, String>> loginUser(LoginParamsModel loginParams);
}
