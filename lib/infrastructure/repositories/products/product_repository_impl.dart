import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:http/http.dart' as http;

class ProductRepositoryImpl with FakeApi implements ProductRepository {
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
