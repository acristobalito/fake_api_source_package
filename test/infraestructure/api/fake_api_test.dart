import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Tests for end point fake API', () {
    late FakeApi fakeApi;
    setUpAll(() {
      fakeApi = FakeApi();
    });

    test('Get getAllCategoriesUrl should return valid string', () {
      final url = fakeApi.getAllCategoriesUrl();
      expect(url, isNotEmpty, reason: 'Url not bet empty');
    });

    test('Get getProductsFromCategoryUrl should return valid string', () {
      final url = fakeApi.getProductsFromCategoryUrl('');
      expect(url, isNotEmpty, reason: 'Url not be empty');
    });
    test('Get getAllProductsUrl should return valid string', () {
      final url = fakeApi.getAllProductsUrl();
      expect(url, isNotEmpty, reason: 'Url not be empty');
    });
    test('Get getLoginUrl should return valid string', () {
      final url = fakeApi.getLoginUrl();
      expect(url, isNotEmpty, reason: 'Url not be empty');
    });
    test('Get getRegisterUrl should return valid string', () {
      final url = fakeApi.getRegisterUrl();
      expect(url, isNotEmpty, reason: 'Url not be empty');
    });
  });
}
