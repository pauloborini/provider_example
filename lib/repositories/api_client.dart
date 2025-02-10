import 'package:dio/dio.dart';
import 'package:motels/app_exports.dart';

class ApiClient extends ChangeNotifier {
  final Dio _dio = Dio();

  ApiClient() {
    setConfigs();
  }

  void setConfigs() {
    _dio.options = BaseOptions(
      baseUrl: AppConstants.baseURL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );
  }

  Future<Response> getData(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } catch (e) {
      throw DioException(requestOptions: RequestOptions(path: endpoint));
    }
  }
}
