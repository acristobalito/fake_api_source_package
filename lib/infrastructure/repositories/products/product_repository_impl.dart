import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:http/http.dart' as http;

/// Clase que implementa [ProductRepository] hereda el mixim [FakeApi].
class ProductRepositoryImpl with FakeApi implements ProductRepository {
  /// Retorna un [Future] de tipo [Either] que contiene como valor left [ResponseError]
  /// y right [CategoriesModel]. Estos valores son asignados dependiendo de la respuesta
  /// del servicio.
  @override
  Future<Either<ResponseError, CategoriesModel>> getAllCategories() async {
    final url = getAllCategoriesUrl();
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return right(CategoriesMapper.categoriesModelFromJson(response.body));
    } else {
      return left(ResponseError('Ops!, ha ocurrido un error'));
    }
  }

  /// Espera como parametro un tipo de dato [String] el cual representa a la categoria por
  /// la que se desea consultar el servicio.
  /// Retorna un [Future] de tipo [Either] que contiene como valor left [ResponseError]
  /// y right un listado de [ProductModel]. Estos valores son asignados dependiendo de la respuesta
  /// del servicio.
  @override
  Future<Either<ResponseError, List<ProductModel>>> getProductsFromCategory(
      String category) async {
    final url = getProductsFromCategoryUrl(category);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return right(ProductMapper.productsFromJson(response.body));
    } else {
      return left(ResponseError('Ops!, ha ocurrido un error'));
    }
  }

  /// Retorna un [Future] de tipo [Either] que contiene como valor left [ResponseError]
  /// y right un listado de [ProductModel]. Estos valores son asignados dependiendo de la respuesta
  /// del servicio.
  @override
  Future<Either<ResponseError, List<ProductModel>>> getAllProducts() async {
    final url = getAllProductsUrl();
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      return right(ProductMapper.productsFromJson(response.body));
    } else {
      return left(ResponseError('Ops!, ha ocurrido un error'));
    }
  }
}
