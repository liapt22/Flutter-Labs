import '../../domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  const RecipeModel({
    required super.id,
    required super.name,
    required super.rating,
    required super.time,
    required super.image,
    super.isBookmarked = false,
    super.author,
    super.authorImage,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['name'] as String?) ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      time: (json['time'] as String?) ?? '',
      image: (json['image'] as String?) ?? '',
      isBookmarked: json['is_bookmarked'] as bool? ?? false,
      author: json['author'] as String?,
      authorImage: json['author_image'] as String?,
    );
  }
}
