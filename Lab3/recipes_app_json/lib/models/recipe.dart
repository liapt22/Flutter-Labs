class Recipe {
  const Recipe({
    required this.id,
    required this.name,
    required this.rating,
    required this.time,
    required this.image,
    this.isBookmarked = false,
    this.author,
    this.authorImage,
  });

  final int id;
  final String name;
  final double rating;
  final String time;
  final String image;
  final bool isBookmarked;
  final String? author;
  final String? authorImage;

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
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
