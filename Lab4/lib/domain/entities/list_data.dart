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
}
