library fake_api_source_package;

import 'package:dartz/dartz.dart';
import 'package:fake_api_source_package/domain/model/categories_model.dart';
import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:fake_api_source_package/domain/repositories/products/product_repository.dart';
import 'package:fake_api_source_package/infrastructure/errors/response_error.dart';
import 'package:fake_api_source_package/infrastructure/repositories/products/product_repository_impl.dart';

/// Clase que se expone para el acceso a los 3 diferentes metodos del paquete
/// Cuenta con los metodos:
/// *  **getAllCategories()**, el cual retorna `Future<Either<ResponseError, CategoriesModel>>`
/// *  __getProductFromCategory(String category)__, el cual retorna `Future<Either<ResponseError, List<ProductModel>>>`
/// *  **getAllProducts()**, el cual retorna `Future<Either<ResponseError, List<ProductModel>>>`
///
class FakeApiSourcePackage {
  final ProductRepository _productRepository = ProductRepositoryImpl();

  /// Retorna un [Future] de tipo [Either] que contiene como valor left [ResponseError]
  /// y right [CategoriesModel]. Estos valores son asignados dependiendo de la respuesta
  /// del servicio.
  Future<Either<ResponseError, CategoriesModel>> getAllCategories() async =>
      _productRepository.getAllCategories();

  /// Espera como parametro un tipo de dato [String] el cual representa a la categoria por
  /// la que se desea consultar el servicio.
  /// Retorna un [Future] de tipo [Either] que contiene como valor left [ResponseError]
  /// y right un listado de [ProductModel]. Estos valores son asignados dependiendo de la respuesta
  /// del servicio.
  Future<Either<ResponseError, List<ProductModel>>> getProductFromCategory(
          String category) async =>
      _productRepository.getProductsFromCategory(category);

  /// Retorna un [Future] de tipo [Either] que contiene como valor left [ResponseError]
  /// y right un listado de [ProductModel]. Estos valores son asignados dependiendo de la respuesta
  /// del servicio.
  Future<Either<ResponseError, List<ProductModel>>> getAllProducts() async =>
      _productRepository.getAllProducts();
}
