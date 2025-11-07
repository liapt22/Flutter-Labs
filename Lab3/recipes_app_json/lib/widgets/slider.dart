import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/data_controller.dart';
import '../models/recipe.dart';
import '../screens/recipe_detail_page.dart';
import 'dish.dart';

class DishesSlider extends GetView<DataController> {
  const DishesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Obx(() {
        final List<Recipe> recipes = controller.recipes;

        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (recipes.isEmpty) {
          return const Center(child: Text('No recipes found'));
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          scrollDirection: Axis.horizontal,
          itemCount: recipes.length,
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return Dish(
              name: recipe.name,
              imageUrl: recipe.image,
              timeLabel: recipe.time,
              rating: recipe.rating,
              onTap: () {
                Get.to(() => RecipeDetailPage(recipe: recipe));
              },
            );
          },
        );
      }),
    );
  }
}
