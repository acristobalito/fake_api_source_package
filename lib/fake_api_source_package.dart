library fake_api_source_package;

import 'package:dartz/dartz.dart';
import 'package:fake_api_source_package/domain/model/categories_model.dart';
import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:fake_api_source_package/domain/repositories/products/product_repository.dart';
import 'package:fake_api_source_package/infrastructure/errors/response_error.dart';
import 'package:fake_api_source_package/infrastructure/repositories/products/product_repository_impl.dart';

/// Class that exposes access to 3 different methods:
/// *  **getAllCategories()**, wich returns `Future<Either<ResponseError, CategoriesModel>>`
/// *  __getProductFromCategory(String category)__, wich returns `Future<Either<ResponseError, List<ProductModel>>>`
/// *  **getAllProducts()**, wich returns `Future<Either<ResponseError, List<ProductModel>>>`
///
class FakeApiSourcePackage {
  final ProductRepository _productRepository = ProductRepositoryImpl();

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
}
