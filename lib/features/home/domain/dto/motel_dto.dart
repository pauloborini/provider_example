import 'package:motels/features/home/domain/dto/suite_dto.dart';

class MotelDTO {
  final String name;
  final String logoUrl;
  final String neighborhood;
  final double distance;
  final int favorites;
  final List<SuiteDTO> suites;
  final int reviewsCount;
  final double rating;

  MotelDTO({
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
