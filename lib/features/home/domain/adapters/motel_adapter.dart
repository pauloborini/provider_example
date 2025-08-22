import 'package:motels/features/home/domain/adapters/suite_adapter.dart';
import 'package:motels/features/home/domain/dto/motel_dto.dart';
import 'package:motels/features/home/domain/entities/motel_entity.dart';

class MotelAdapter {
  MotelAdapter._();

  static MotelDTO fromJson(Map<String, dynamic> json) {
    final suites = json['suites'] as List<dynamic>? ?? [];

    return MotelDTO(
      name: json['fantasia'] as String,
      logoUrl: json['logo'] as String,
      neighborhood: json['bairro'] as String,
      distance: (json['distancia'] as num).toDouble(),
      favorites: json['qtdFavoritos'] as int,
      suites: suites.map((item) => SuiteAdapter.fromJson(item as Map<String, dynamic>)).toList(),
      reviewsCount: json['qtdAvaliacoes'] as int,
      rating: (json['media'] as num).toDouble(),
    );
  }

  static Map<String, dynamic> toJson(MotelDTO dto) {
    return {
      'fantasia': dto.name,
      'logo': dto.logoUrl,
      'bairro': dto.neighborhood,
      'distancia': dto.distance,
      'qtdFavoritos': dto.favorites,
      'suites': dto.suites.map(SuiteAdapter.toJson).toList(),
      'qtdAvaliacoes': dto.reviewsCount,
      'media': dto.rating,
    };
  }

  static MotelEntity toEntity(MotelDTO dto) {
    return MotelEntity(
      name: dto.name,
      logoUrl: dto.logoUrl,
      neighborhood: dto.neighborhood,
      distance: dto.distance,
      favorites: dto.favorites,
      suites: dto.suites.map(SuiteAdapter.toEntity).toList(),
      reviewsCount: dto.reviewsCount,
      rating: dto.rating,
    );
  }
}
