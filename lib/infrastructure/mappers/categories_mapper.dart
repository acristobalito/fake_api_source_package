import 'dart:convert';

import 'package:fake_api_source_package/domain/model/categories_model.dart';

/// Class used to map the JSON service response to the **CategoriesModel** model.
class CategoriesMapper {
  /// Returns a [CategoriesModel] data type.
  static CategoriesModel categoriesModelFromJson(String str) => CategoriesModel(
      categories: List<String>.from(json.decode(str).map((x) => x)));
}
