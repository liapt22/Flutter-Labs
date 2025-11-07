import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/data_controller.dart';
import '../models/detail_data.dart';
import '../models/recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DataController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Get.back<void>(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        final detail = controller.detail.value;

        if (controller.isLoading.value && detail == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (detail == null) {
          return const Center(child: Text('Details unavailable'));
        }

        final detailedRecipe = detail.recipe;
        final chef = detail.chef;
        final serving = detail.serving;
        final ingredients = detail.ingredients;
        final tabs = detail.tabs;

        final heroImage = detailedRecipe.image.isNotEmpty
            ? detailedRecipe.image
            : recipe.image;
        final title = detailedRecipe.title.isNotEmpty
            ? detailedRecipe.title
            : recipe.name;
        final rating =
            recipe.rating != 0 ? recipe.rating : detailedRecipe.rating;
        final cookTime = detailedRecipe.cookTime.isNotEmpty
            ? detailedRecipe.cookTime
            : recipe.time;
        final reviews = detailedRecipe.reviews;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeroSection(
                imageUrl: heroImage,
                rating: rating,
                cookTime: cookTime,
                isBookmarked: detailedRecipe.isBookmarked,
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                  ),
                  if (reviews.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        '($reviews)',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          height: 1.4,
                          letterSpacing: 0,
                          color: Color(0xFFA9A9A9),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 24),
              _ChefCard(chef: chef),
              const SizedBox(height: 24),
              _TabsRow(tabs: tabs),
              const SizedBox(height: 24),
              _ServingInfo(serving: serving),
              const SizedBox(height: 24),
              const Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C2C2C),
                ),
              ),
              const SizedBox(height: 16),
              _IngredientsList(ingredients: ingredients),
            ],
          ),
        );
      }),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    required this.imageUrl,
    required this.rating,
    required this.cookTime,
    required this.isBookmarked,
  });

  final String imageUrl;
  final double rating;
  final String cookTime;
  final bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: _NetworkImage(
            url: imageUrl,
            height: 220,
          ),
        ),
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.0),
                    Color.fromRGBO(0, 0, 0, 0.7),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 16,
          top: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE1B3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: Color(0xFFFFAD30), size: 18),
                const SizedBox(width: 6),
                Text(
                  rating.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 16,
          bottom: 16,
          child: Row(
            children: [
              const Icon(
                Icons.timer_outlined,
                color: Color(0xFFD9D9D9),
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                cookTime.isEmpty ? '-' : cookTime,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFD9D9D9),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/bookmark.png',
                    width: 18,
                    height: 18,
                    color: isBookmarked
                        ? const Color(0xFF129575)
                        : const Color(0xFF9E9E9E),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChefCard extends StatelessWidget {
  const _ChefCard({required this.chef});

  final ChefInfo chef;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          ClipOval(
            child: _NetworkImage(
              url: chef.profileImage,
              height: 54,
              width: 54,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chef.name.isEmpty ? 'Unknown Chef' : chef.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  chef.location.isEmpty ? '—' : chef.location,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFA9A9A9),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: chef.isFollowing
                  ? const Color(0xFFE0E0E0)
                  : const Color(0xFF129575),
              minimumSize: const Size(96, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              chef.isFollowing ? 'Following' : 'Follow',
              style: TextStyle(
                color: chef.isFollowing ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServingInfo extends StatelessWidget {
  const _ServingInfo({required this.serving});

  final ServingInfo serving;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _InfoLabel(
          assetPath: 'assets/icons/group.png',
          label: serving.serves.isEmpty ? '-' : serving.serves,
        ),
        _InfoLabel(
          label: serving.totalItems == 0
              ? '-'
              : '${serving.totalItems} items',
        ),
      ],
    );
  }
}

class _InfoLabel extends StatelessWidget {
  const _InfoLabel({
    this.assetPath,
    required this.label,
  });

  final String? assetPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (assetPath != null) ...[
          Image.asset(
            assetPath!,
            height: 18,
            width: 18,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFFA9A9A9),
          ),
        ),
      ],
    );
  }
}

class _TabsRow extends StatelessWidget {
  const _TabsRow({required this.tabs});

  final List<DetailTab> tabs;

  @override
  Widget build(BuildContext context) {
    if (tabs.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      children: tabs
          .map(
            (tab) => Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: tab.active ? const Color(0xFF129575) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.transparent),
                ),
                child: Text(
                  tab.name,
                  style: TextStyle(
                    color: tab.active ? Colors.white : const Color(0xFF129575),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _IngredientsList extends StatelessWidget {
  const _IngredientsList({required this.ingredients});

  final List<IngredientInfo> ingredients;

  @override
  Widget build(BuildContext context) {
    if (ingredients.isEmpty) {
      return const Text('No ingredients available');
    }

    return Column(
      children: ingredients
          .map(
            (ingredient) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: _NetworkImage(url: ingredient.icon),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      ingredient.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                  ),
                  Text(
                    ingredient.quantity,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _NetworkImage extends StatelessWidget {
  const _NetworkImage({
    required this.url,
    this.height = 100,
    this.width = double.infinity,
  });

  final String url;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return _fallback();
    }

    return Image.network(
      url,
      height: height,
      width: width,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => _fallback(),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return SizedBox(
          height: height,
          width: width,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _fallback() {
    return Container(
      height: height,
      width: width,
      color: const Color(0xFFE0E0E0),
      alignment: Alignment.center,
      child: const Icon(
        Icons.image,
        color: Color(0xFF9E9E9E),
      ),
    );
  }
}
