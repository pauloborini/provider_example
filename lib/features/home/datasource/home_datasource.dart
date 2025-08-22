import 'package:motels/core/exceptions/app_exception.dart';
import 'package:motels/features/home/domain/adapters/api_response_adapter.dart';
import 'package:motels/features/home/domain/dto/motel_dto.dart';
import 'package:motels/shared/api/api_client.dart';

abstract interface class IHomeDatasource {
  Future<List<MotelDTO>> getMotels({
    required int page,
    required double latitude,
    required double longitude,
  });
}

class HomeDatasource implements IHomeDatasource {
  final ApiClient _apiClient;

  HomeDatasource({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<List<MotelDTO>> getMotels({required int page, required double latitude, required double longitude}) async {
    try {
      const endpoint = '/';
      final result = await _apiClient.getData(endpoint);
      final apiResponse = ApiResponseAdapter.fromJson(result);
      return apiResponse.data.motels;
    } catch (e) {
      rethrow;
    }
  }
}
