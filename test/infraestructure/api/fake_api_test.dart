import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Tests for end point fake API', () {
    late FakeApi fakeApi;
    setUpAll(() {
      fakeApi = FakeApi();
    });

    test('Get getAllCategoriesUrl should return valid string', () {
      // Arrange
      // Act
      final url = fakeApi.getAllCategoriesUrl();
      // Assert
      expect(url, isNotEmpty);
    });

    test('Get getProductsFromCategoryUrl should return valid string', () {
      // Arrange
      // Act
      final url = fakeApi.getProductsFromCategoryUrl('');
      // Assert
      expect(url, isNotEmpty);
    });
    test('Get getAllProductsUrl should return valid string', () {
      // Arrange
      // Act
      final url = fakeApi.getAllProductsUrl();
      // Assert
      expect(url, isNotEmpty);
    });
    test('Get getLoginUrl should return valid string', () {
      // Arrange
      // Act
      final url = fakeApi.getLoginUrl();
      // Assert
      expect(url, isNotEmpty);
    });
    test('Get getRegisterUrl should return valid string', () {
      // Arrange
      // Act
      final url = fakeApi.getRegisterUrl();
      // Assert
      expect(url, isNotEmpty);
    });
  });
}
