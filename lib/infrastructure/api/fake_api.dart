mixin class FakeApi {
  final _baseUrl = 'https://fakestoreapi.com';

  String getAllCategoriesUrl() => '$_baseUrl/products/categories';
  String getProductsFromCategoryUrl(String category) =>
      '$_baseUrl/products/category/$category';
  String getAllProductsUrl() => '$_baseUrl/products';
}
