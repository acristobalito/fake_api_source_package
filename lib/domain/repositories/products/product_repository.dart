import 'package:dartz/dartz.dart';
import 'package:fake_api_source_package/domain/model/categories_model.dart';
import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:fake_api_source_package/infrastructure/errors/responnse_error.dart';

abstract interface class ProductRepository {
  Future<Either<ResponseError, CategoriesModel>> getAllCategories();
  Future<Either<ResponseError, List<ProductModel>>> getProductsFromCategory(
      String category);
  Future<Either<ResponseError, List<ProductModel>>> getAllProducts();
}
