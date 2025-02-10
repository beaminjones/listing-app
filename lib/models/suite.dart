import 'package:motel_listing_app/models/category_item.dart';
import 'package:motel_listing_app/models/item.dart';
import 'package:motel_listing_app/models/period.dart';

class Suite {
  final String name;
  final int quantity;
  final bool showQuantity;
  final List<String> photos;
  final List<Item> items;
  final List<CategoryItem> categoryItems;
  final List<Period> periods;

  Suite({
    required this.name,
    required this.quantity,
    required this.showQuantity,
    required this.photos,
    required this.items,
    required this.categoryItems,
    required this.periods,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      name: json['nome'],
      quantity: json['qtd'],
      showQuantity: json['exibirQtdDisponiveis'],
      photos: (json['fotos'] as List).map((photo) => photo.toString()).toList(),
      items:
          (json['itens'] as List).map((item) => Item.fromJson(item)).toList(),
      categoryItems: (json['categoriaItens'] as List)
          .map((category) => CategoryItem.fromJson(category))
          .toList(),
      periods: (json['periodos'] as List)
          .map((period) => Period.fromJson(period))
          .toList(),
    );
  }
}
