import '../../domain/entities/detail_data.dart';

class DetailedRecipeModel extends DetailedRecipe {
  const DetailedRecipeModel({
    required super.id,
    required super.title,
    required super.image,
    required super.rating,
    required super.reviews,
    required super.cookTime,
    required super.isBookmarked,
  });

  factory DetailedRecipeModel.fromJson(Map<String, dynamic> json) {
    return DetailedRecipeModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: (json['title'] as String?) ?? '',
      image: (json['image'] as String?) ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviews: (json['reviews'] as String?) ?? '',
      cookTime: (json['cook_time'] as String?) ?? '',
      isBookmarked: json['is_bookmarked'] as bool? ?? false,
    );
  }
}

class ChefInfoModel extends ChefInfo {
  const ChefInfoModel({
    required super.name,
    required super.profileImage,
    required super.location,
    required super.isFollowing,
  });

  factory ChefInfoModel.fromJson(Map<String, dynamic> json) {
    return ChefInfoModel(
      name: (json['name'] as String?) ?? '',
      profileImage: (json['profile_image'] as String?) ?? '',
      location: (json['location'] as String?) ?? '',
      isFollowing: json['is_following'] as bool? ?? false,
    );
  }
}

class DetailTabModel extends DetailTab {
  const DetailTabModel({
    required super.name,
    required super.active,
  });

  factory DetailTabModel.fromJson(Map<String, dynamic> json) {
    return DetailTabModel(
      name: (json['name'] as String?) ?? '',
      active: json['active'] as bool? ?? false,
    );
  }
}

class ServingInfoModel extends ServingInfo {
  const ServingInfoModel({
    required super.serves,
    required super.totalItems,
  });

  factory ServingInfoModel.fromJson(Map<String, dynamic> json) {
    return ServingInfoModel(
      serves: (json['serves'] as String?) ?? '',
      totalItems: (json['total_items'] as num?)?.toInt() ?? 0,
    );
  }
}

class IngredientInfoModel extends IngredientInfo {
  const IngredientInfoModel({
    required super.id,
    required super.name,
    required super.quantity,
    required super.icon,
  });

  factory IngredientInfoModel.fromJson(Map<String, dynamic> json) {
    return IngredientInfoModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['name'] as String?) ?? '',
      quantity: (json['quantity'] as String?) ?? '',
      icon: (json['icon'] as String?) ?? '',
    );
  }
}

class DetailDataModel extends DetailData {
  const DetailDataModel({
    required DetailedRecipeModel super.recipe,
    required ChefInfoModel super.chef,
    required List<DetailTabModel> super.tabs,
    required ServingInfoModel super.serving,
    required List<IngredientInfoModel> super.ingredients,
  });

  factory DetailDataModel.fromJson(Map<String, dynamic> json) {
    return DetailDataModel(
      recipe: DetailedRecipeModel.fromJson(
        json['recipe'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
      chef: ChefInfoModel.fromJson(
        json['chef'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
      tabs: (json['tabs'] as List<dynamic>? ?? <dynamic>[])
          .map((item) => DetailTabModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      serving: ServingInfoModel.fromJson(
        json['serving'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
      ingredients: (json['ingredients'] as List<dynamic>? ?? <dynamic>[])
          .map(
            (item) =>
                IngredientInfoModel.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
