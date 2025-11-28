class Category {
  const Category({
    required this.id,
    required this.name,
    this.selected = false,
  });

  final int id;
  final String name;
  final bool selected;

  Category copyWith({
    int? id,
    String? name,
    bool? selected,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      selected: selected ?? this.selected,
    );
  }
}
