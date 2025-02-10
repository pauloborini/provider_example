import 'package:motels/app_exports.dart';

class SuiteModel {
  final String name;
  final int quantity;
  final bool showAvailableQuantity;
  final List<String> photos;
  final List<ItemModel> items;
  final List<ItemCategoryModel> itemCategories;
  final List<PeriodModel> periods;

  SuiteModel({
    required this.name,
    required this.quantity,
    required this.showAvailableQuantity,
    required this.photos,
    required this.items,
    required this.itemCategories,
    required this.periods,
  });

  factory SuiteModel.fromJson(Map<String, dynamic> json) {
    final items = json['itens'] as List<dynamic>? ?? [];
    final itemCategories = json['categorias'] as List<dynamic>? ?? [];
    final periods = json['periodos'] as List<dynamic>? ?? [];

    return SuiteModel(
      name: json['nome'] as String,
      quantity: json['qtd'] as int,
      showAvailableQuantity: json['exibirQtdDisponiveis'] as bool? ?? false,
      photos: List<String>.from(json['fotos']),
      items: items.map((item) => ItemModel.fromJson(item as Map<String, dynamic>)).toList(),
      itemCategories: itemCategories.map((item) => ItemCategoryModel.fromJson(item as Map<String, dynamic>)).toList(),
      periods: periods.map((item) => PeriodModel.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}
