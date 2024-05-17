/// Modelo empleado por **ProductModel** para almacenar las calificaciones de un producto.
class RatingModel {
  double rate;
  int count;

  RatingModel({
    required this.rate,
    required this.count,
  });
}
