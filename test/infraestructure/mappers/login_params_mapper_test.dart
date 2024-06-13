import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('On loginParamsModelToJson return a valid String Json', () {
    final loginParams = LoginParamsModel(username: '', password: '');
    final json = LoginParamsMapper.loginParamsModelToJson(loginParams);
    expect(json, isNotEmpty, reason: 'Json not be empty');
  });
}
