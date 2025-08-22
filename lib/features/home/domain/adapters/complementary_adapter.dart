import 'package:motels/features/home/domain/dto/complementary_dto.dart';
import 'package:motels/features/home/domain/entities/complementary_entity.dart';

class ItemAdapter {
  ItemAdapter._();

  static ItemDTO fromJson(Map<String, dynamic> json) {
    return ItemDTO(
      name: json['nome'] as String,
    );
  }

  static Map<String, dynamic> toJson(ItemDTO dto) {
    return {
      'nome': dto.name,
    };
  }

  static ItemEntity toEntity(ItemDTO dto) {
    return ItemEntity(
      name: dto.name,
    );
  }

  static ItemDTO toDTO(ItemEntity entity) {
    return ItemDTO(
      name: entity.name,
    );
  }
}

class ItemCategoryAdapter {
  ItemCategoryAdapter._();

  static ItemCategoryDTO fromJson(Map<String, dynamic> json) {
    return ItemCategoryDTO(
      name: json['nome'] as String,
      iconUrl: json['icone'] as String,
    );
  }

  static Map<String, dynamic> toJson(ItemCategoryDTO dto) {
    return {
      'nome': dto.name,
      'icone': dto.iconUrl,
    };
  }

  static ItemCategoryEntity toEntity(ItemCategoryDTO dto) {
    return ItemCategoryEntity(
      name: dto.name,
      iconUrl: dto.iconUrl,
    );
  }

  static ItemCategoryDTO toDTO(ItemCategoryEntity entity) {
    return ItemCategoryDTO(
      name: entity.name,
      iconUrl: entity.iconUrl,
    );
  }
}

class PeriodAdapter {
  PeriodAdapter._();

  static PeriodDTO fromJson(Map<String, dynamic> json) {
    final discount = json['desconto'] as Map<String, dynamic>?;

    return PeriodDTO(
      formattedTime: json['tempoFormatado'] as String,
      time: json['tempo'] as String,
      price: (json['valor'] as num).toDouble(),
      totalPrice: (json['valorTotal'] as num).toDouble(),
      hasCourtesy: json['temCortesia'] as bool,
      discount: discount != null ? PeriodDiscountAdapter.fromJson(discount) : null,
    );
  }

  static Map<String, dynamic> toJson(PeriodDTO dto) {
    return {
      'tempoFormatado': dto.formattedTime,
      'tempo': dto.time,
      'valor': dto.price,
      'valorTotal': dto.totalPrice,
      'temCortesia': dto.hasCourtesy,
      'desconto': dto.discount != null ? PeriodDiscountAdapter.toJson(dto.discount!) : null,
    };
  }

  static PeriodEntity toEntity(PeriodDTO dto) {
    return PeriodEntity(
      formattedTime: dto.formattedTime,
      time: dto.time,
      price: dto.price,
      totalPrice: dto.totalPrice,
      hasCourtesy: dto.hasCourtesy,
      discount: dto.discount != null ? PeriodDiscountAdapter.toEntity(dto.discount!) : null,
    );
  }

  static PeriodDTO toDTO(PeriodEntity entity) {
    return PeriodDTO(
      formattedTime: entity.formattedTime,
      time: entity.time,
      price: entity.price,
      totalPrice: entity.totalPrice,
      hasCourtesy: entity.hasCourtesy,
      discount: entity.discount != null ? PeriodDiscountAdapter.toDTO(entity.discount!) : null,
    );
  }
}

class PeriodDiscountAdapter {
  PeriodDiscountAdapter._();

  static PeriodDiscountDTO fromJson(Map<String, dynamic> json) {
    return PeriodDiscountDTO(
      value: (json['desconto'] as num).toDouble(),
    );
  }

  static Map<String, dynamic> toJson(PeriodDiscountDTO dto) {
    return {
      'desconto': dto.value,
    };
  }

  static PeriodDiscountEntity toEntity(PeriodDiscountDTO dto) {
    return PeriodDiscountEntity(
      value: dto.value,
    );
  }

  static PeriodDiscountDTO toDTO(PeriodDiscountEntity entity) {
    return PeriodDiscountDTO(
      value: entity.value,
    );
  }
}
