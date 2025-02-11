import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:motels/app_exports.dart';

class ApiClient extends ChangeNotifier {
  final String _baseUrl = AppConstants.baseURL;

  Future<Map<String, dynamic>> getData(String endpoint) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception('Erro ao buscar dados: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
