import 'package:motels/models/suite_model.dart';

class MotelModel {
  final String name;
  final String logo;
  final String neighborhood;
  final double distance;
  final int favorites;
  final List<SuiteModel> suites;
  final int reviewsCount;
  final double rating;

  MotelModel({
    required this.name,
    required this.logo,
    required this.neighborhood,
    required this.distance,
    required this.favorites,
    required this.suites,
    required this.reviewsCount,
    required this.rating,
  });

  factory MotelModel.fromJson(Map<String, dynamic> json) {
    final suites = json['suites'] as List<dynamic>? ?? [];

    return MotelModel(
      name: json['fantasia'] as String,
      logo: json['logo'] as String,
      neighborhood: json['bairro'] as String,
      distance: (json['distancia'] as num).toDouble(),
      favorites: json['qtdFavoritos'] as int,
      suites: suites.map((item) => SuiteModel.fromJson(item as Map<String, dynamic>)).toList(),
      reviewsCount: json['qtdAvaliacoes'] as int,
      rating: (json['media'] as num).toDouble(),
    );
  }
}
