import 'package:fake_api_source_package/domain/model/geolocation_model.dart';

/// Model used to store the user address returned by the service
class AddressModel {
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final GeolocationModel geolocation;

  AddressModel(
      {required this.city,
      required this.street,
      required this.number,
      required this.zipcode,
      required this.geolocation});
}
