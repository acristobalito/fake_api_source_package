/// Clase que provee las url's de los servicios a consumir
mixin class FakeApi {
  final _baseUrl = 'https://fakestoreapi.com';

  /// Retorna la url del servicio que consulta todas las categorias existentes.
  String getAllCategoriesUrl() => '$_baseUrl/products/categories';

  /// Retorna la url del servicio que consulta los productos de una determinada categoria.
  /// Espera como parametro un tipo de dato [String] el cual representa una categoria especifica.
  String getProductsFromCategoryUrl(String category) =>
      '$_baseUrl/products/category/$category';

  /// Retorna la ulr del servicio que consulta todos los productos existentes.
  String getAllProductsUrl() => '$_baseUrl/products';
}
