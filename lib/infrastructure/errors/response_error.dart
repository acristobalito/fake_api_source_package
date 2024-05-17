/// Modelo que implemnta [Exception] empleado para el control de errores provinientes de ejecutar los servicios de la FakeApiStore.
class ResponseError implements Exception {
  final String message;

  ResponseError(this.message);
}
