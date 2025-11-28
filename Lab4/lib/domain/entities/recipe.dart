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

  Recipe copyWith({
    bool? isBookmarked,
  }) {
    return Recipe(
      id: id,
      name: name,
      rating: rating,
      time: time,
      image: image,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      author: author,
      authorImage: authorImage,
    );
  }
}
