class Category {
  const Category({
    required this.id,
    required this.name,
    this.selected = false,
  });

  final int id;
  final String name;
  final bool selected;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: (json['name'] as String?) ?? '',
      selected: json['selected'] as bool? ?? false,
    );
  }

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
