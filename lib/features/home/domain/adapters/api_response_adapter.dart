import 'package:motels/features/home/domain/adapters/motel_adapter.dart';
import 'package:motels/features/home/domain/dto/api_response_dto.dart';
import 'package:motels/features/home/domain/entities/api_response_entity.dart';

class ApiResponseAdapter {
  ApiResponseAdapter._();

  static ApiResponseDTO fromJson(Map<String, dynamic> json) {
    return ApiResponseDTO(
      success: json['sucesso'] as bool,
      data: DataAdapter.fromJson(json['data'] as Map<String, dynamic>),
      message: json['mensagem'] != null ? List<String>.from(json['mensagem']) : <String>[],
    );
  }

  static ApiResponseEntity toEntity(ApiResponseDTO dto) {
    return ApiResponseEntity(
      success: dto.success,
      data: DataAdapter.toEntity(dto.data),
      message: dto.message,
    );
  }
}

class DataAdapter {
  DataAdapter._();

  static DataDTO fromJson(Map<String, dynamic> json) {
    final motels = json['moteis'] as List<dynamic>? ?? [];

    return DataDTO(
      page: json['pagina'] as int? ?? 0,
      perPage: json['qtdPorPagina'] as int,
      totalSuites: json['totalSuites'] as int,
      totalMotels: json['totalMoteis'] as int,
      radius: (json['raio'] as num).toDouble(),
      maxPages: (json['maxPaginas'] as num).toDouble(),
      motels: motels.map((item) => MotelAdapter.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  static Map<String, dynamic> toJson(DataDTO dto) {
    return {
      'pagina': dto.page,
      'qtdPorPagina': dto.perPage,
      'totalSuites': dto.totalSuites,
      'totalMoteis': dto.totalMotels,
      'raio': dto.radius,
      'maxPaginas': dto.maxPages,
      'moteis': dto.motels.map(MotelAdapter.toJson).toList(),
    };
  }

  static DataEntity toEntity(DataDTO dto) {
    return DataEntity(
      page: dto.page,
      perPage: dto.perPage,
      totalSuites: dto.totalSuites,
      totalMotels: dto.totalMotels,
      radius: dto.radius,
      maxPages: dto.maxPages,
      motels: dto.motels.map(MotelAdapter.toEntity).toList(),
    );
  }
}
