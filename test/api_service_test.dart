import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:motel_listing_app/services/api_service.dart';
import 'package:motel_listing_app/models/motel.dart';

import 'mocks/api_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('ApiService', () {
    late ApiService apiService;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      apiService = ApiService(mockClient);
    });

    test(
        'Deve retornar uma lista de motéis quando a requisição for bem-sucedida',
        () async {
      const mockResponse =
          '{"data": {"moteis": [{"id": 1, "fantasia": "Motel Teste"}]}}';

      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response(mockResponse, 200));

      final motels = apiService.fetchMotels();

      expect(await motels, isA<List<Motel>>());
      expect((await motels).first.name, "Motel Teste");
    });

    test('Deve lançar uma exceção quando a requisição falhar', () async {
      when(mockClient.get(any))
          .thenThrow(http.ClientException('Erro de conexão'));

      await expectLater(
        apiService.fetchMotels(),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('Erro de conexão'),
        )),
      );
    });
  });
}
