import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/recipe.dart';
import '../controllers/feed_controller.dart';
import '../screens/recipe_detail_page.dart';
import 'recipe_card.dart';

class NewRecipesSlider extends GetView<FeedController> {
  const NewRecipesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
          child: Text(
            'New Recipes',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 218,
          child: Obx(() {
            final List<Recipe> newRecipes = controller.newRecipes;

            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (newRecipes.isEmpty) {
              return const Center(child: Text('No new recipes found'));
            }

            return ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              scrollDirection: Axis.horizontal,
              itemCount: newRecipes.length,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final recipe = newRecipes[index];
                return RecipeCard(
                  name: recipe.name,
                  imageUrl: recipe.image,
                  authorPicture: recipe.authorImage,
                  authorFullname: recipe.author ?? 'Unknown',
                  rating: recipe.rating,
                  timeLabel: recipe.time,
                  onTap: () {
                    Get.to(() => RecipeDetailPage(recipe: recipe));
                  },
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
