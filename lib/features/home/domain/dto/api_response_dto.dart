import 'package:motels/features/home/domain/dto/motel_dto.dart';

class ApiResponseDTO {
  final bool success;
  final DataDTO data;
  final List<String> message;

  ApiResponseDTO({
    required this.success,
    required this.data,
    required this.message,
  });
}

class DataDTO {
  final int page;
  final int perPage;
  final int totalSuites;
  final int totalMotels;
  final double radius;
  final double maxPages;
  final List<MotelDTO> motels;

  DataDTO({
    required this.page,
    required this.perPage,
    required this.totalSuites,
    required this.totalMotels,
    required this.radius,
    required this.maxPages,
    required this.motels,
  });
}
