import 'package:motels/features/home/domain/adapters/complementary_adapter.dart';
import 'package:motels/features/home/domain/dto/suite_dto.dart';
import 'package:motels/features/home/domain/entities/suite_entity.dart';

class SuiteAdapter {
  SuiteAdapter._();

  static SuiteDTO fromJson(Map<String, dynamic> json) {
    final items = json['itens'] as List<dynamic>? ?? [];
    final itemCategories = json['categoriaItens'] as List<dynamic>? ?? [];
    final periods = json['periodos'] as List<dynamic>? ?? [];

    return SuiteDTO(
      name: json['nome'] as String,
      quantity: json['qtd'] as int,
      showAvailableQuantity: json['exibirQtdDisponiveis'] as bool? ?? false,
      photos: List<String>.from(json['fotos'] ?? []),
      items: items.map((item) => ItemAdapter.fromJson(item as Map<String, dynamic>)).toList(),
      itemCategoryList: itemCategories.map((cat) => ItemCategoryAdapter.fromJson(cat as Map<String, dynamic>)).toList(),
      periodList: periods.map((period) => PeriodAdapter.fromJson(period as Map<String, dynamic>)).toList(),
    );
  }

  static Map<String, dynamic> toJson(SuiteDTO dto) {
    return {
      'nome': dto.name,
      'qtd': dto.quantity,
      'exibirQtdDisponiveis': dto.showAvailableQuantity,
      'fotos': dto.photos,
      'itens': dto.items.map(ItemAdapter.toJson).toList(),
      'categoriaItens': dto.itemCategoryList.map(ItemCategoryAdapter.toJson).toList(),
      'periodos': dto.periodList.map(PeriodAdapter.toJson).toList(),
    };
  }

  static SuiteEntity toEntity(SuiteDTO dto) {
    return SuiteEntity(
      name: dto.name,
      quantity: dto.quantity,
      showAvailableQuantity: dto.showAvailableQuantity,
      photos: dto.photos,
      items: dto.items.map(ItemAdapter.toEntity).toList(),
      itemCategoryList: dto.itemCategoryList.map(ItemCategoryAdapter.toEntity).toList(),
      periodList: dto.periodList.map(PeriodAdapter.toEntity).toList(),
    );
  }
}
