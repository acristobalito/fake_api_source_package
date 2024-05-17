import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:fake_api_source_package/fake_api_source_package.dart';
import 'package:flutter/material.dart';

class MainScreenProvider extends ChangeNotifier {
  final catalog = FakeApiSourcePackage();
  final category = 'electronics';
  List<String>? categories;
  List<ProductModel>? categoryProducts;
  List<ProductModel>? products;

  MainScreenProvider() {
    _getCategories();
    _getProducts(category: category);
    _getProducts();
  }

  void _getCategories() async {
    final response = await catalog.getAllCategories();
    response.fold((error) {
      categories = null;
    }, (response) {
      categories = response.categories;
    });
    notifyListeners();
  }

  void _getProducts({String? category}) async {
    if (category != null) {
      final response = await catalog.getProductFromCategory(category);
      categoryProducts = response.fold((error) => null, (response) => response);
    } else {
      final response = await catalog.getAllProducts();
      products = response.fold((error) => null, (response) => response);
    }
    notifyListeners();
  }
}
