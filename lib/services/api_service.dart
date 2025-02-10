import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/motel.dart';

class ApiService {
  final http.Client client;

  ApiService(this.client);

  static const List<String> _apiUrls = [
    "https://www.jsonkeeper.com/b/1IXK",
    "https://www.npoint.io/docs/e728bb91e0cd56cc0711",
  ];

  Future<List<Motel>> fetchMotels() async {
    for (final url in _apiUrls) {
      try {
        final response = await client.get(Uri.parse(url));
        if (response.statusCode == 200) {
          return _parseMotels(response.body);
        }
      } on http.ClientException catch (e) {
        throw Exception("Erro ao conectar-se à API: ${e.message}");
      } on FormatException {
        throw Exception("Erro ao processar os dados da API.");
      }
    }

    throw Exception("Falha ao carregar os dados de todas as APIs.");
  }

  List<Motel> _parseMotels(String responseBody) {
    final Map<String, dynamic> decodedData = json.decode(responseBody);
    final List<dynamic> motelsData = decodedData['data']['moteis'];
    return motelsData.map((json) => Motel.fromJson(json)).toList();
  }
}
