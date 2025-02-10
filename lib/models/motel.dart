import 'package:motel_listing_app/models/suite.dart';

class Motel {
  final String name;
  final String logo;
  final String neighborhood;
  final double distance;
  final int favoriteCount;
  final List<Suite> suites;
  final int reviewCount;
  final double rating;
  final double price;

  Motel({
    required this.name,
    required this.logo,
    required this.neighborhood,
    required this.distance,
    required this.favoriteCount,
    required this.suites,
    required this.reviewCount,
    required this.rating,
    required this.price,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(
      name: json['fantasia'] ?? 'Sem nome',
      logo: json['logo'] ?? '',
      neighborhood: json['bairro'] ?? 'Desconhecido',
      distance: (json['distancia'] ?? 0).toDouble(),
      favoriteCount: json['qtdFavoritos'] ?? 0,
      suites: (json['suites'] as List?)
              ?.map((suite) => Suite.fromJson(suite))
              .toList() ??
          [],
      reviewCount: json['qtdAvaliacoes'] ?? 0,
      rating: (json['media'] ?? 0).toDouble(),
      price: (json['preco'] ?? 0).toDouble(),
    );
  }
}
