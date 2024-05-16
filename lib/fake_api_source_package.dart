library fake_api_source_package;

import 'package:dartz/dartz.dart';
import 'package:fake_api_source_package/domain/model/categories_model.dart';
import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:fake_api_source_package/domain/repositories/products/product_repository.dart';
import 'package:fake_api_source_package/infrastructure/errors/responnse_error.dart';
import 'package:fake_api_source_package/infrastructure/repositories/products/product_repository_impl.dart';

class FakeApiSourcePackage {
  static final FakeApiSourcePackage _catalogSingleton =
      FakeApiSourcePackage._internal();

  factory FakeApiSourcePackage() {
    return _catalogSingleton;
  }

  FakeApiSourcePackage._internal();

  final ProductRepository productRepository = ProductRepositoryImpl();

  Future<Either<ResponseError, CategoriesModel>> getAllCategories() async =>
      productRepository.getAllCategories();

  Future<Either<ResponseError, List<ProductModel>>> getProductFromCategory(
          String category) async =>
      productRepository.getProductsFromCategory(category);

  Future<Either<ResponseError, List<ProductModel>>> getAllProducts() async =>
      productRepository.getAllProducts();
}
