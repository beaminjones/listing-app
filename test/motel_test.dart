import 'package:flutter_test/flutter_test.dart';
import 'package:motel_listing_app/models/motel.dart';

void main() {
  group('Motel', () {
    test('Deve criar um Motel a partir de um JSON válido', () {
      final json = {
        'fantasia': 'Motel Teste',
        'logo': 'https://example.com/logo.png',
        'bairro': 'Centro',
        'distancia': 5.0,
        'qtdFavoritos': 10,
        'suites': [
          {
            'nome': 'Suíte Master',
            'qtd': 2,
            'exibirQtdDisponiveis': true,
            'fotos': ['https://example.com/photo1.jpg'],
            'itens': [],
            'categoriaItens': [],
            'periodos': [],
          },
        ],
        'qtdAvaliacoes': 20,
        'media': 4.5,
        'preco': 150.0,
      };

      final motel = Motel.fromJson(json);

      expect(motel.name, 'Motel Teste');
      expect(motel.logo, 'https://example.com/logo.png');
      expect(motel.neighborhood, 'Centro');
      expect(motel.distance, 5.0);
      expect(motel.favoriteCount, 10);
      expect(motel.suites.length, 1);
      expect(motel.suites.first.name, 'Suíte Master');
      expect(motel.reviewCount, 20);
      expect(motel.rating, 4.5);
      expect(motel.price, 150.0);
    });

    test('Deve usar valores padrão quando campos estão ausentes ou são nulos',
        () {
      final json = {
        'fantasia': null,
        'logo': null,
        'bairro': null,
        'distancia': null,
        'qtdFavoritos': null,
        'suites': null,
        'qtdAvaliacoes': null,
        'media': null,
        'preco': null,
      };

      final motel = Motel.fromJson(json);

      expect(motel.name, 'Sem nome');
      expect(motel.logo, '');
      expect(motel.neighborhood, 'Desconhecido');
      expect(motel.distance, 0.0);
      expect(motel.favoriteCount, 0);
      expect(motel.suites, isEmpty);
      expect(motel.reviewCount, 0);
      expect(motel.rating, 0.0);
      expect(motel.price, 0.0);
    });

    test('Deve lidar com uma lista vazia de suites', () {
      final json = {
        'fantasia': 'Motel Teste',
        'logo': 'https://example.com/logo.png',
        'bairro': 'Centro',
        'distancia': 5.0,
        'qtdFavoritos': 10,
        'suites': [],
        'qtdAvaliacoes': 20,
        'media': 4.5,
        'preco': 150.0,
      };

      final motel = Motel.fromJson(json);

      expect(motel.suites, isEmpty);
    });
  });
}
