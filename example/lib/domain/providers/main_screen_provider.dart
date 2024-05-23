import 'package:fake_api_source_package/fake_api_source_package.dart';
import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
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

  void loginUser() async {
    final params = LoginParamsModel(username: 'mor_2314', password: '83r5^_');
    final request = await catalog.loginUser(params);
    final response = request.fold(
      (l) => l.message,
      (r) => r,
    );
    print(response);
  }

  void registerUser() async {
    final params = UserModel(
        email: 'a@gmail.com',
        username: 'antobob',
        password: '123',
        name: NameModel(firstname: 'firstname', lastname: 'lastname'),
        address: AddressModel(
            city: 'Fake Store',
            street: 'Unknow',
            number: 123,
            zipcode: '123-456',
            geolocation: GeolocationModel(lat: '-12.123', long: '80.0000')),
        phone: '999999');
    final request = await catalog.registerUser(params);
    final response = request.fold(
      (l) => l.message,
      (r) => r,
    );
    print(response);
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
