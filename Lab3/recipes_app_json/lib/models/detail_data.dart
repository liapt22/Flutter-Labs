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

  factory DetailedRecipe.fromJson(Map<String, dynamic> json) {
    return DetailedRecipe(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: (json['title'] as String?) ?? '',
      image: (json['image'] as String?) ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviews: (json['reviews'] as String?) ?? '',
      cookTime: (json['cook_time'] as String?) ?? '',
      isBookmarked: json['is_bookmarked'] as bool? ?? false,
    );
  }

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

  factory ChefInfo.fromJson(Map<String, dynamic> json) {
    return ChefInfo(
      name: (json['name'] as String?) ?? '',
      profileImage: (json['profile_image'] as String?) ?? '',
      location: (json['location'] as String?) ?? '',
      isFollowing: json['is_following'] as bool? ?? false,
    );
  }
}

class DetailTab {
  const DetailTab({
    required this.name,
    required this.active,
  });

  final String name;
  final bool active;

  factory DetailTab.fromJson(Map<String, dynamic> json) {
    return DetailTab(
      name: (json['name'] as String?) ?? '',
      active: json['active'] as bool? ?? false,
    );
  }
}

class ServingInfo {
  const ServingInfo({
    required this.serves,
    required this.totalItems,
  });

  final String serves;
  final int totalItems;

  factory ServingInfo.fromJson(Map<String, dynamic> json) {
    return ServingInfo(
      serves: (json['serves'] as String?) ?? '',
      totalItems: (json['total_items'] as num?)?.toInt() ?? 0,
    );
  }
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

  factory IngredientInfo.fromJson(Map<String, dynamic> json) {
    return IngredientInfo(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['name'] as String?) ?? '',
      quantity: (json['quantity'] as String?) ?? '',
      icon: (json['icon'] as String?) ?? '',
    );
  }
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

  factory DetailData.fromJson(Map<String, dynamic> json) {
    return DetailData(
      recipe: DetailedRecipe.fromJson(
        json['recipe'] as Map<String, dynamic>? ?? {},
      ),
      chef: ChefInfo.fromJson(
        json['chef'] as Map<String, dynamic>? ?? {},
      ),
      tabs: (json['tabs'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => DetailTab.fromJson(item as Map<String, dynamic>))
          .toList(),
      serving: ServingInfo.fromJson(
        json['serving'] as Map<String, dynamic>? ?? {},
      ),
      ingredients: (json['ingredients'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => IngredientInfo.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
