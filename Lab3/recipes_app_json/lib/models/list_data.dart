import 'category.dart';
import 'recipe.dart';
import 'user_profile.dart';

class ListData {
  const ListData({
    required this.user,
    required this.searchPlaceholder,
    required this.categories,
    required this.recipes,
    required this.newRecipes,
  });

  final UserProfile user;
  final String searchPlaceholder;
  final List<Category> categories;
  final List<Recipe> recipes;
  final List<Recipe> newRecipes;

  factory ListData.fromJson(Map<String, dynamic> json) {
    final filters = json['filters'] as Map<String, dynamic>? ?? {};
    final categoriesJson = filters['categories'] as List<dynamic>? ?? <dynamic>[];

    return ListData(
      user: UserProfile.fromJson(json['user'] as Map<String, dynamic>? ?? {}),
      searchPlaceholder: (filters['search_placeholder'] as String?) ?? '',
      categories: categoriesJson
          .map((item) => Category.fromJson(item as Map<String, dynamic>))
          .toList(),
      recipes: (json['recipes'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => Recipe.fromJson(item as Map<String, dynamic>))
          .toList(),
      newRecipes: (json['new_recipes'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => Recipe.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
