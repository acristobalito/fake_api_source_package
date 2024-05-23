import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';

/// Model used to store the user data returned by the service
class UserModel {
  final String email;
  final String username;
  final String password;
  final NameModel name;
  final AddressModel address;
  final String phone;

  UserModel(
      {required this.email,
      required this.username,
      required this.password,
      required this.name,
      required this.address,
      required this.phone});
}
