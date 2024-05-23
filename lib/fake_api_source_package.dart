library fake_api_source_package;

import 'package:fake_api_source_package/infrastructure/repositories/product/product_repository_impl.dart';
import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_api_source_package/infrastructure/repositories/user/user_repository_impl.dart';

/// Class that exposes access to 3 different methods:
/// *  **getAllCategories()**, wich returns `Future<Either<ResponseError, CategoriesModel>>`
/// *  __getProductFromCategory(String category)__, wich returns `Future<Either<ResponseError, List<ProductModel>>>`
/// *  **getAllProducts()**, wich returns `Future<Either<ResponseError, List<ProductModel>>>`
///
class FakeApiSourcePackage {
  final ProductRepository _productRepository = ProductRepositoryImpl();
  final UserRepository _userRepository = UserRepositoryImpl();

  /// Returns a [Future] value of type [Either] wich contains as left value [ResponseError]
  /// and right value [CategoriesModel]. These values ​​are assigned depending on the service response.
  Future<Either<ResponseError, CategoriesModel>> getAllCategories() async =>
      _productRepository.getAllCategories();

  /// Expect a [String] data type as a parameter wich represent the categorie with which to consult the service.
  /// Returns a [Future] value of type [Either] wich contains as left value [ResponseError]
  /// and right value a list of [ProductModel]. These values ​​are assigned depending on the service response.
  Future<Either<ResponseError, List<ProductModel>>> getProductFromCategory(
          String category) async =>
      _productRepository.getProductsFromCategory(category);

  /// Returns a [Future] value of type [Either] wich contains as left value [ResponseError]
  /// and right value a list of [ProductModel]. These values ​​are assigned depending on the service response.
  Future<Either<ResponseError, List<ProductModel>>> getAllProducts() async =>
      _productRepository.getAllProducts();

  /// Returns a [Future] value of type [Either] wich contains as left value [ResponseError]
  /// and right value a [int]. These values ​​are assigned depending on the service response.
  Future<Either<ResponseError, int>> registerUser(UserModel user) async =>
      _userRepository.registerUser(user);

  /// Returns a [Future] value of type [Either] wich contains as left value [ResponseError]
  /// and right value a [String]. These values ​​are assigned depending on the service response.
  Future<Either<ResponseError, String>> loginUser(
          LoginParamsModel params) async =>
      _userRepository.loginUser(params);
}
