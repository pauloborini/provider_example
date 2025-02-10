import 'package:motels/app_exports.dart';

class ApiResponseModel {
  final bool success;
  final DataModel data;
  final List<String> message;

  ApiResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      success: json['sucesso'] as bool,
      data: DataModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['mensagem'] != null ? List<String>.from(json['mensagem']) : <String>[],
    );
  }
}

class DataModel {
  final int page;
  final int perPage;
  final int totalSuites;
  final int totalMotels;
  final double radius;
  final double maxPages;
  final List<MotelModel> motels;

  DataModel({
    required this.page,
    required this.perPage,
    required this.totalSuites,
    required this.totalMotels,
    required this.radius,
    required this.maxPages,
    required this.motels,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    final motels = json['moteis'] as List<dynamic>? ?? [];

    return DataModel(
      page: json['pagina'] as int? ?? 0,
      perPage: json['qtdPorPagina'] as int,
      totalSuites: json['totalSuites'] as int,
      totalMotels: json['totalMoteis'] as int,
      radius: (json['raio'] as num).toDouble(),
      maxPages: (json['maxPaginas'] as num).toDouble(),
      motels: motels.map((item) => MotelModel.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}
