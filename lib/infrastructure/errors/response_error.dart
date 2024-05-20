/// Model that implements [Exception] used to control errors resulting from running the FakeApiStore services.
class ResponseError implements Exception {
  final String message;

  ResponseError(this.message);
}
