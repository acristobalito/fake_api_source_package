import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('On call categoriesFromJson return a instance of CategoriesModel', () {
    // Arrange
    const json =
        "[\"electronics\",\"jewelery\",\"men's clothing\",\"women's clothing\"]";
    // Act
    final categoryModel = CategoriesMapper.categoriesModelFromJson(json);
    // Assert
    expect(categoryModel, isA<CategoriesModel>());
  });
}
