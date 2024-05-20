import 'package:dartz/dartz.dart';
import 'package:fake_api_source_package/domain/model/categories_model.dart';
import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:fake_api_source_package/infrastructure/errors/response_error.dart';

/// Interface that exposes the repository methods:
/// * getAllCategories()
/// * getProductsFromCategory(String category)
/// * getAllProducts()
///
/// __getProductsFromCategory(String category)__ receives a [String] data type as a parameter wich represents a category.
abstract interface class ProductRepository {
  Future<Either<ResponseError, CategoriesModel>> getAllCategories();
  Future<Either<ResponseError, List<ProductModel>>> getProductsFromCategory(
      String category);
  Future<Either<ResponseError, List<ProductModel>>> getAllProducts();
}
