import 'package:fake_api_source_package/fake_api_source_package.dart';
import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'mocks/mock_product_repository.dart';
import 'mocks/mock_user_repository.dart';

void main() {
  group(
    "Test for product getAllCategories, getProductFromCategory, getAllProducts, registerUser, loginUser",
    () {
      late MockProductRepository mockProductRepository;
      late MockUserRepository mockUserRepository;
      late UserModel userModelExpected;
      late LoginParamsModel loginParamsModelExpected;
      late ProductModel productModelExpected;
      late FakeApiSourcePackage catalog;
      setUpAll(
        () {
          userModelExpected = UserModel(
              email: '',
              username: '',
              password: '',
              name: NameModel(firstname: '', lastname: ''),
              address: AddressModel(
                  city: '',
                  street: '',
                  number: 12000,
                  zipcode: 'zipcode',
                  geolocation: GeolocationModel(lat: '', long: '')),
              phone: '');
          productModelExpected = ProductModel(
              id: 1,
              title: '',
              price: 0,
              description: '',
              category: '',
              image: '',
              rating: RatingModel(rate: 0, count: 0));
          loginParamsModelExpected =
              LoginParamsModel(username: '', password: '');
          mockProductRepository = MockProductRepository();
          mockUserRepository = MockUserRepository();
          catalog =
              FakeApiSourcePackage(mockProductRepository, mockUserRepository);
          registerFallbackValue(userModelExpected);
          registerFallbackValue(loginParamsModelExpected);
        },
      );
      test(
        'On call getAllCategories and get a success response, should return an instance of CategoriesModel',
        () async {
          when(() => mockProductRepository.getAllCategories()).thenAnswer(
            (_) async => Right(CategoriesModel(categories: ['Category'])),
          );
          final categoriesResponse = await catalog.getAllCategories();
          final response = categoriesResponse.fold(
              (onError) => null, (responseCategories) => responseCategories);
          expect(response, isA<CategoriesModel>(),
              reason: 'Response should a valid CategorieModel');
        },
      );

      test(
        'On call getAllCategories and get a failure response, should return null',
        () async {
          when(() => mockProductRepository.getAllCategories()).thenAnswer(
            (_) async => Left(ResponseError('Error mockeado')),
          );
          final categoriesResponse = await catalog.getAllCategories();
          final response = categoriesResponse.fold(
              (onError) => null, (responseCategories) => responseCategories);
          expect(response, null, reason: 'Response should be null');
        },
      );

      test(
        'On call getProductFromCategory and get a success response, should return an instance of List<ProductModel>',
        () async {
          when(() => mockProductRepository.getProductsFromCategory(any()))
              .thenAnswer(
            (_) async => Right([productModelExpected]),
          );
          final productsFromCategoryResponse =
              await catalog.getProductFromCategory('');
          final response = productsFromCategoryResponse.fold((onError) => null,
              (responseProductsFromCategory) => responseProductsFromCategory);
          expect(response, isA<List<ProductModel>>(),
              reason: 'Response should be a valid list of products');
        },
      );

      test(
        'On call getProductFromCategory and get a failure response, should return null',
        () async {
          when(() => mockProductRepository.getProductsFromCategory(any()))
              .thenAnswer(
            (_) async => Left(ResponseError('Error mockeado')),
          );
          final productsFromCategoryResponse = await catalog.getAllCategories();
          final response = productsFromCategoryResponse.fold((onError) => null,
              (responseProductsFromCategory) => responseProductsFromCategory);
          expect(response, null, reason: 'Response should be null');
        },
      );

      test(
        'On call getAllProducts and get a success response, should return an instance of List<ProductModel>',
        () async {
          when(() => mockProductRepository.getAllProducts()).thenAnswer(
            (_) async => Right([productModelExpected]),
          );
          final productsFromCategoryResponse = await catalog.getAllProducts();
          final response = productsFromCategoryResponse.fold(
              (onError) => null, (responseAllProducts) => responseAllProducts);
          expect(response, isA<List<ProductModel>>(),
              reason: 'Response should be a list of products');
        },
      );

      test(
        'On call getAllProducts and get a failure response, should return null',
        () async {
          when(() => mockProductRepository.getAllProducts()).thenAnswer(
            (_) async => Left(ResponseError('Error mockeado')),
          );
          final productsFromCategoryResponse = await catalog.getAllCategories();
          final response = productsFromCategoryResponse.fold(
              (onError) => null, (responseAllProducts) => responseAllProducts);
          expect(response, null, reason: 'Response should be null');
        },
      );

      test(
        'On call registerUser and get a success response, should return an int value',
        () async {
          when(() => mockUserRepository.registerUser(any())).thenAnswer(
            (_) async => const Right(1),
          );
          final registerResponse =
              await catalog.registerUser(userModelExpected);
          final response =
              registerResponse.fold((onError) => null, (userId) => userId);
          expect(response, 1, reason: 'Response should be 1');
        },
      );

      test(
        'On call registerUser and get a failure response, should return null',
        () async {
          when(() => mockUserRepository.registerUser(any())).thenAnswer(
            (_) async => Left(ResponseError('Error mockeado')),
          );
          final registerResponse =
              await catalog.registerUser(userModelExpected);
          final response =
              registerResponse.fold((onError) => null, (userId) => userId);
          expect(response, null, reason: 'Response should be null');
        },
      );

      test(
        'On call loginUser and get a success response, should return an int value',
        () async {
          when(() => mockUserRepository.loginUser(any())).thenAnswer(
            (_) async => const Right('token'),
          );
          final loginResponse =
              await catalog.loginUser(loginParamsModelExpected);
          final response =
              loginResponse.fold((onError) => null, (token) => token);
          expect(response, 'token', reason: 'Response should be token');
        },
      );

      test(
        'On call loginUser and get a failure response, should return null',
        () async {
          when(() => mockUserRepository.loginUser(any())).thenAnswer(
            (_) async => Left(ResponseError('Error mockeado')),
          );
          final loginResponse =
              await catalog.loginUser(loginParamsModelExpected);
          final response =
              loginResponse.fold((onError) => null, (token) => token);
          expect(response, null, reason: 'Response should be null');
        },
      );
    },
  );
}
