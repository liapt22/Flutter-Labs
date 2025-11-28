import '../../domain/entities/list_data.dart';
import 'category_model.dart';
import 'recipe_model.dart';
import 'user_profile_model.dart';

class ListDataModel extends ListData {
  const ListDataModel({
    required UserProfileModel super.user,
    required super.searchPlaceholder,
    required List<CategoryModel> super.categories,
    required List<RecipeModel> super.recipes,
    required List<RecipeModel> super.newRecipes,
  });

  factory ListDataModel.fromJson(Map<String, dynamic> json) {
    final filters = json['filters'] as Map<String, dynamic>? ?? {};
    final categoriesJson =
        filters['categories'] as List<dynamic>? ?? <dynamic>[];

    return ListDataModel(
      user: UserProfileModel.fromJson(
        json['user'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
      searchPlaceholder: (filters['search_placeholder'] as String?) ?? '',
      categories: categoriesJson
          .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      recipes: (json['recipes'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => RecipeModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      newRecipes: (json['new_recipes'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => RecipeModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
