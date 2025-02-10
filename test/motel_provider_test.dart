import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:motel_listing_app/models/motel.dart';
import 'package:motel_listing_app/models/suite.dart';
import 'package:motel_listing_app/models/item.dart';
import 'package:motel_listing_app/models/category_item.dart';
import 'package:motel_listing_app/models/period.dart';
import 'package:motel_listing_app/services/api_service.dart';
import 'package:motel_listing_app/providers/motel_provider.dart';

import 'mocks/motel_provider_test.mocks.dart';

@GenerateMocks([
  ApiService,
  Suite,
  Item,
  CategoryItem,
  Period,
])
void main() {
  group('MotelProvider', () {
    late MotelProvider motelProvider;
    late MockApiService mockApiService;
    late MockSuite mockSuite;
    late MockItem mockItem;
    late MockCategoryItem mockCategoryItem;
    late MockPeriod mockPeriod;

    setUp(() {
      mockApiService = MockApiService();
      mockSuite = MockSuite();
      mockItem = MockItem();
      mockCategoryItem = MockCategoryItem();
      mockPeriod = MockPeriod();

      motelProvider = MotelProvider(mockApiService);
    });

    test('Deve carregar motéis corretamente', () async {
      when(mockSuite.name).thenReturn('Suíte Master');
      when(mockSuite.quantity).thenReturn(2);
      when(mockSuite.showQuantity).thenReturn(true);
      when(mockSuite.photos).thenReturn([
        'https://example.com/photo1.jpg',
        'https://example.com/photo2.jpg',
      ]);
      when(mockSuite.items).thenReturn([mockItem]);
      when(mockSuite.categoryItems).thenReturn([mockCategoryItem]);
      when(mockSuite.periods).thenReturn([mockPeriod]);

      when(mockItem.name).thenReturn('Cama King Size');

      when(mockCategoryItem.name).thenReturn('Comodidades');

      when(mockPeriod.time).thenReturn('Diária');
      when(mockPeriod.value).thenReturn(200.0);

      final mockMotels = [
        Motel(
          name: 'Motel Teste',
          logo: 'https://example.com/logo.png',
          neighborhood: 'Centro',
          distance: 5.0,
          favoriteCount: 10,
          suites: [mockSuite],
          reviewCount: 20,
          rating: 4.5,
          price: 150.0,
        ),
      ];
      when(mockApiService.fetchMotels()).thenAnswer((_) async => mockMotels);

      await motelProvider.fetchMotels();

      expect(motelProvider.motels, mockMotels);
      expect(motelProvider.isLoading, false);
      expect(motelProvider.errorMessage, isNull);
    });

    test('Deve definir uma mensagem de erro quando a requisição falhar',
        () async {
      when(mockApiService.fetchMotels())
          .thenThrow(Exception('Erro de conexão'));

      await motelProvider.fetchMotels();

      expect(motelProvider.motels, isEmpty);
      expect(motelProvider.isLoading, false);
      expect(motelProvider.errorMessage, isNotNull);
      expect(motelProvider.errorMessage,
          'Erro ao carregar motéis. Tente novamente mais tarde.');
    });

    test('Deve alterar o estado de isLoading durante o carregamento', () async {
      final mockMotels = [
        Motel(
          name: 'Motel Teste',
          logo: 'https://example.com/logo.png',
          neighborhood: 'Centro',
          distance: 5.0,
          favoriteCount: 10,
          suites: [mockSuite],
          reviewCount: 20,
          rating: 4.5,
          price: 150.0,
        ),
      ];
      when(mockApiService.fetchMotels()).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 100));
        return mockMotels;
      });

      expect(motelProvider.isLoading, false);

      final future = motelProvider.fetchMotels();

      expect(motelProvider.isLoading, true);

      await future;

      expect(motelProvider.isLoading, false);
    });
  });
}
