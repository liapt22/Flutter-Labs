import 'package:flutter/foundation.dart' show debugPrint;
import 'package:get/get.dart';

import '../models/category.dart';
import '../models/detail_data.dart';
import '../models/recipe.dart';
import '../models/user_profile.dart';
import '../services/data_service.dart';

class DataController extends GetxController {
  DataController({
    DataService? dataService,
  }) : _dataService = dataService ?? DataService();

  final DataService _dataService;

  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxList<Category> categories = <Category>[].obs;
  final RxList<Recipe> recipes = <Recipe>[].obs;
  final RxList<Recipe> newRecipes = <Recipe>[].obs;
  final Rxn<UserProfile> user = Rxn<UserProfile>();
  final RxString searchPlaceholder = ''.obs;
  final Rxn<DetailData> detail = Rxn<DetailData>();
  final RxString searchQuery = ''.obs;

  List<Recipe> _allRecipes = <Recipe>[];
  List<Recipe> _allNewRecipes = <Recipe>[];

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      final appData = await _dataService.fetchAppData();
      final listData = appData.list;
      final detailData = appData.details;

      user.value = listData.user;
      searchQuery.value = '';
      searchPlaceholder.value = listData.searchPlaceholder;
      categories.assignAll(listData.categories);
      _allRecipes = List<Recipe>.from(listData.recipes);
      _allNewRecipes = List<Recipe>.from(listData.newRecipes);
      _applyFilters();
      detail.value = detailData;
    } catch (error, stackTrace) {
      hasError.value = true;
      debugPrint('Failed to load data: $error\n$stackTrace');
    } finally {
      isLoading.value = false;
    }
  }

  void selectCategory(int categoryId) {
    categories.assignAll(
      categories
          .map(
            (category) => category.copyWith(
              selected: category.id == categoryId,
            ),
          )
          .toList(),
    );
    _applyFilters();
  }

  void updateSearch(String query) {
    searchQuery.value = query;
    _applyFilters();
  }

  void _applyFilters() {
    final query = searchQuery.value.trim().toLowerCase();

    final filteredRecipes = _allRecipes.where((recipe) {
      if (query.isEmpty) {
        return true;
      }
      return recipe.name.toLowerCase().contains(query);
    }).toList();

    final filteredNewRecipes = _allNewRecipes.where((recipe) {
      if (query.isEmpty) {
        return true;
      }
      return recipe.name.toLowerCase().contains(query);
    }).toList();

    recipes.assignAll(filteredRecipes);
    newRecipes.assignAll(filteredNewRecipes);
  }
}
