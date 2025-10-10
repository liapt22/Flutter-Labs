import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dish.dart';
import '../screens/recipe_detail_page.dart';
import '../services/mock_data.dart';

class DishesSlider extends StatefulWidget {
  const DishesSlider({super.key});

  @override
  State<DishesSlider> createState() => _DishesSliderState();
}

class _DishesSliderState extends State<DishesSlider> {
  List<dynamic> recipes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/recipes.json',
      );
      final data = json.decode(response);
      setState(() {
        recipes = data is List ? data : data['recipes'] ?? [];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        recipes = MockDataService.getRecipes();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (recipes.isEmpty) {
      return const Center(child: Text('No recipes found'));
    }

    return SizedBox(
      height: 320,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Dish(
            name: recipe['name'] ?? 'Unknown',
            imageUrl: recipe['imageUrl'] ?? recipe['image'] ?? '',
            time: recipe['time'] ?? 0,
            rating: (recipe['rating'] ?? 0.0).toDouble(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const RecipeDetailPage(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
