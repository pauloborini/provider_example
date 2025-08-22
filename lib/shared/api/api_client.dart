import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motels/core/constants/constants.dart';
import 'package:motels/core/exceptions/app_exception.dart';
import 'package:motels/core/utils/abstractions/service.dart';

class ApiClient extends AppService {
  final String _baseUrl = AppConstants.baseURL;

  Future<Map<String, dynamic>> getData(String endpoint) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body) as Map<String, dynamic>;
      } else {
        throw AppException('Erro ao buscar dados: ${response.statusCode}');
      }
    } catch (e) {
      if (e is AppException) {
        rethrow;
      }
      throw AppException('Erro na comunicação: $e');
    }
  }
}
