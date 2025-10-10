import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/recipe.dart';
import 'package:recipes_app/services/mock_data.dart';
import 'package:recipes_app/screens/recipe_detail_page.dart';

class NewRecipesSlider extends StatefulWidget {
  const NewRecipesSlider({super.key});

  @override
  State<NewRecipesSlider> createState() => _NewRecipesSliderState();
}

class _NewRecipesSliderState extends State<NewRecipesSlider> {
  List<Map<String, dynamic>> newRecipes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNewRecipes();
  }

  void _loadNewRecipes() {
    setState(() {
      newRecipes = MockDataService.getNewRecipes();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (newRecipes.isEmpty) {
      return const Center(child: Text('No new recipes found'));
    }

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
          height: 214,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            scrollDirection: Axis.horizontal,
            itemCount: newRecipes.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final recipeData = newRecipes[index];
              return Recipe(
                name: recipeData['name'] ?? 'Unknown',
                imageUrl: recipeData['imageUrl'] ?? '',
                authorPicture: recipeData['authorPicture'] ?? '',
                authorFullname: recipeData['authorFullname'] ?? 'Unknown',
                rating: (recipeData['rating'] ?? 0.0).toDouble(),
                time: recipeData['time'] ?? 0,
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
        ),
      ],
    );
  }
}
