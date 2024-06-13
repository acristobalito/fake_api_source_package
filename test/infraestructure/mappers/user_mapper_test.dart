import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Get Json from AddressModel', () {
    final userModel = UserModel(
        email: '',
        username: '',
        password: '',
        name: NameModel(firstname: '', lastname: ''),
        address: AddressModel(
            city: '',
            street: '',
            number: 1,
            zipcode: '',
            geolocation: GeolocationModel(lat: '', long: '')),
        phone: '');
    final json = UserMapper.nameModelToJson(userModel);
    expect(json, isA<Map>(), reason: 'json should be a valid Map');
  });
}
