import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motels/core/constants/constants.dart';
import 'package:motels/core/exceptions/app_exception.dart';
import 'package:motels/core/utils/abstractions/service.dart';
import 'package:motels/core/utils/result/result.dart';

class ApiClient extends AppService {
  final String _baseUrl = AppConstants.baseURL;

  Future<Result<String, Map<String, dynamic>>> getData(String endpoint) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    setLoading(true);
    try {
      final response = await http.get(url);
      setLoading(false);

      if (response.statusCode == 200) {
        return Success(json.decode(response.body) as Map<String, dynamic>);
      } else {
        return Failure('Erro ao buscar dados: ${response.statusCode}');
      }
    } catch (e) {
      setLoading(false);
      if (e is AppException) {
        return Failure(e.toString());
      }
      return Failure('Erro na comunicação: $e');
    }
  }
}
