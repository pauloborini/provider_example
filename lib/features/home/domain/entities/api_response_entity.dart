import 'package:motels/features/home/domain/entities/motel_entity.dart';

class ApiResponseEntity {
  final bool success;
  final DataEntity data;
  final List<String> message;

  const ApiResponseEntity({
    required this.success,
    required this.data,
    required this.message,
  });
}

class DataEntity {
  final int page;
  final int perPage;
  final int totalSuites;
  final int totalMotels;
  final double radius;
  final double maxPages;
  final List<MotelEntity> motels;

  const DataEntity({
    required this.page,
    required this.perPage,
    required this.totalSuites,
    required this.totalMotels,
    required this.radius,
    required this.maxPages,
    required this.motels,
  });
}
