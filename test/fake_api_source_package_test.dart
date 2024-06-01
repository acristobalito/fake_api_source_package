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
          // Arrange
          when(() => mockProductRepository.getAllCategories()).thenAnswer(
            (_) async => Right(CategoriesModel(categories: ['Category'])),
          );
          // Act
          final categoriesResponse = await catalog.getAllCategories();
          final response = categoriesResponse.fold(
              (onError) => null, (responseCategories) => responseCategories);
          // Assert
          expect(response, isA<CategoriesModel>());
        },
      );

      test(
        'On call getAllCategories and get a failure response, should return null',
        () async {
          // Arrange
          when(() => mockProductRepository.getAllCategories()).thenAnswer(
            (_) async => Left(ResponseError('Error mockeado')),
          );
          // Act
          final categoriesResponse = await catalog.getAllCategories();
          final response = categoriesResponse.fold(
              (onError) => null, (responseCategories) => responseCategories);
          // Assert
          expect(response, null);
        },
      );

      test(
        'On call getProductFromCategory and get a success response, should return an instance of List<ProductModel>',
        () async {
          // Arrange
          when(() => mockProductRepository.getProductsFromCategory(any()))
              .thenAnswer(
            (_) async => Right([productModelExpected]),
          );
          // Act
          final productsFromCategoryResponse =
              await catalog.getProductFromCategory('');
          final response = productsFromCategoryResponse.fold((onError) => null,
              (responseProductsFromCategory) => responseProductsFromCategory);
          // Assert
          expect(response, isA<List<ProductModel>>());
        },
      );

      test(
        'On call getProductFromCategory and get a failure response, should return null',
        () async {
          // Arrange
          when(() => mockProductRepository.getProductsFromCategory(any()))
              .thenAnswer(
            (_) async => Left(ResponseError('Error mockeado')),
          );
          // Act
          final productsFromCategoryResponse = await catalog.getAllCategories();
          final response = productsFromCategoryResponse.fold((onError) => null,
              (responseProductsFromCategory) => responseProductsFromCategory);
          // Assert
          expect(response, null);
        },
      );

      test(
        'On call getAllProducts and get a success response, should return an instance of List<ProductModel>',
        () async {
          // Arrange
          when(() => mockProductRepository.getAllProducts()).thenAnswer(
            (_) async => Right([productModelExpected]),
          );
          // Act
          final productsFromCategoryResponse = await catalog.getAllProducts();
          final response = productsFromCategoryResponse.fold(
              (onError) => null, (responseAllProducts) => responseAllProducts);
          // Assert
          expect(response, isA<List<ProductModel>>());
        },
      );

      test(
        'On call getAllProducts and get a failure response, should return null',
        () async {
          // Arrange
          when(() => mockProductRepository.getAllProducts()).thenAnswer(
            (_) async => Left(ResponseError('Error mockeado')),
          );
          // Act
          final productsFromCategoryResponse = await catalog.getAllCategories();
          final response = productsFromCategoryResponse.fold(
              (onError) => null, (responseAllProducts) => responseAllProducts);
          // Assert
          expect(response, null);
        },
      );

      test(
        'On call registerUser and get a success response, should return an int value',
        () async {
          // Arrange
          when(() => mockUserRepository.registerUser(any())).thenAnswer(
            (_) async => const Right(1),
          );
          // Act
          final registerResponse =
              await catalog.registerUser(userModelExpected);
          final response =
              registerResponse.fold((onError) => null, (userId) => userId);
          // Assert
          expect(response, 1);
        },
      );

      test(
        'On call registerUser and get a failure response, should return null',
        () async {
          // Arrange
          when(() => mockUserRepository.registerUser(any())).thenAnswer(
            (_) async => Left(ResponseError('Error mockeado')),
          );
          // Act
          final registerResponse =
              await catalog.registerUser(userModelExpected);
          final response =
              registerResponse.fold((onError) => null, (userId) => userId);
          // Assert
          expect(response, null);
        },
      );

      test(
        'On call loginUser and get a success response, should return an int value',
        () async {
          // Arrange
          when(() => mockUserRepository.loginUser(any())).thenAnswer(
            (_) async => const Right('token'),
          );
          // Act
          final loginResponse =
              await catalog.loginUser(loginParamsModelExpected);
          final response =
              loginResponse.fold((onError) => null, (token) => token);
          // Assert
          expect(response, 'token');
        },
      );

      test(
        'On call loginUser and get a failure response, should return null',
        () async {
          // Arrange
          when(() => mockUserRepository.loginUser(any())).thenAnswer(
            (_) async => Left(ResponseError('Error mockeado')),
          );
          // Act
          final loginResponse =
              await catalog.loginUser(loginParamsModelExpected);
          final response =
              loginResponse.fold((onError) => null, (token) => token);
          // Assert
          expect(response, null);
        },
      );
    },
  );
}
