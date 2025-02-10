class CategoryItem {
  final String name;
  final String icon;

  CategoryItem({required this.name, required this.icon});

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      name: json['nome'],
      icon: json['icone'],
    );
  }
}
