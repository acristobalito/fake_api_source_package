import 'dart:convert';

import 'package:fake_api_source_package/domain/model/categories_model.dart';

/// Clase empleada para mapear la respuesta del servicio JSON al modelo **CategoriesModel**
class CategoriesMapper {
  /// Retorna un tipo de dato [CategoriesModel].
  static CategoriesModel categoriesModelFromJson(String str) => CategoriesModel(
      categories: List<String>.from(json.decode(str).map((x) => x)));
}
