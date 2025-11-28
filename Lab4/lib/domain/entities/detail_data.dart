class DetailedRecipe {
  const DetailedRecipe({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.cookTime,
    required this.isBookmarked,
  });

  final int id;
  final String title;
  final String image;
  final double rating;
  final String reviews;
  final String cookTime;
  final bool isBookmarked;

  DetailedRecipe copyWith({
    bool? isBookmarked,
  }) {
    return DetailedRecipe(
      id: id,
      title: title,
      image: image,
      rating: rating,
      reviews: reviews,
      cookTime: cookTime,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}

class ChefInfo {
  const ChefInfo({
    required this.name,
    required this.profileImage,
    required this.location,
    required this.isFollowing,
  });

  final String name;
  final String profileImage;
  final String location;
  final bool isFollowing;
}

class DetailTab {
  const DetailTab({
    required this.name,
    required this.active,
  });

  final String name;
  final bool active;
}

class ServingInfo {
  const ServingInfo({
    required this.serves,
    required this.totalItems,
  });

  final String serves;
  final int totalItems;
}

class IngredientInfo {
  const IngredientInfo({
    required this.id,
    required this.name,
    required this.quantity,
    required this.icon,
  });

  final int id;
  final String name;
  final String quantity;
  final String icon;
}

class DetailData {
  const DetailData({
    required this.recipe,
    required this.chef,
    required this.tabs,
    required this.serving,
    required this.ingredients,
  });

  final DetailedRecipe recipe;
  final ChefInfo chef;
  final List<DetailTab> tabs;
  final ServingInfo serving;
  final List<IngredientInfo> ingredients;
}
