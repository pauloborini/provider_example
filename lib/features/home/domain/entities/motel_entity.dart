import 'package:motels/features/home/domain/entities/suite_entity.dart';

class MotelEntity {
  final String name;
  final String logoUrl;
  final String neighborhood;
  final double distance;
  final int favorites;
  final List<SuiteEntity> suites;
  final int reviewsCount;
  final double rating;

  const MotelEntity({
    required this.name,
    required this.logoUrl,
    required this.neighborhood,
    required this.distance,
    required this.favorites,
    required this.suites,
    required this.reviewsCount,
    required this.rating,
  });
}
