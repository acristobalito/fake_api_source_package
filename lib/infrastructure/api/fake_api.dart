/// Class that provides the urls of the services to be consumed
mixin class FakeApi {
  static const _baseUrl = 'https://fakestoreapi.com';

  /// Returns the url of the service that consults all existing categories.
  String getAllCategoriesUrl() => '$_baseUrl/products/categories';

  /// Returns the url of the service that consults the products of a certain category.
  /// Expect a [String] data type as a parameter wich represents a category.
  String getProductsFromCategoryUrl(String category) =>
      '$_baseUrl/products/category/$category';

  /// Returns the ulr of the service that queries all existing products.
  String getAllProductsUrl() => '$_baseUrl/products';

  /// Returns the ulr of the user login service.
  String getLoginUrl() => '$_baseUrl/auth/login';

  /// Returns the ulr of the register user service.
  String getRegisterUrl() => '$_baseUrl/users';
}
