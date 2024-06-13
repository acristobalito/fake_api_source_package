import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('On call categoriesFromJson return a instance of CategoriesModel', () {
    const json =
        "[\"electronics\",\"jewelery\",\"men's clothing\",\"women's clothing\"]";
    final categoryModel = CategoriesMapper.categoriesModelFromJson(json);
    expect(categoryModel, isA<CategoriesModel>(),
        reason: 'CategoryModel should be a valid object');
  });
}
