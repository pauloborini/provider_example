import 'package:motels/app_exports.dart';

class MotelRepository extends ChangeNotifier {
  final ApiClient _apiClient;

  MotelRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<List<MotelModel>> fetchMotels() async {
    try {
      final response = await _apiClient.getData('/');
      final apiResponse = ApiResponseModel.fromJson(response);
      return apiResponse.data.motels;
    } catch (e) {
      rethrow;
    }
  }
}
