import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('On loginParamsModelToJson return a valid String Json', () {
    // Arrange
    final loginParams = LoginParamsModel(username: '', password: '');
    // Act
    final json = LoginParamsMapper.loginParamsModelToJson(loginParams);
    // Assert
    expect(json, isNotEmpty);
  });
}
