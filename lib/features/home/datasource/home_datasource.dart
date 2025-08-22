import 'package:motels/core/utils/result/result.dart';
import 'package:motels/features/home/domain/adapters/api_response_adapter.dart';
import 'package:motels/features/home/domain/dto/motel_dto.dart';
import 'package:motels/shared/api/api_client.dart';

abstract interface class IHomeDatasource {
  Future<Result<String, List<MotelDTO>>> getMotels({
    required int page,
    required double latitude,
    required double longitude,
  });
}

class HomeDatasource implements IHomeDatasource {
  final ApiClient _apiClient;

  HomeDatasource({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<Result<String, List<MotelDTO>>> getMotels({
    required int page,
    required double latitude,
    required double longitude,
  }) async {
    final endpoint = '/motels?page=$page&lat=$latitude&lng=$longitude';

    final result = await _apiClient.getData(endpoint);

    return result.when((error) => Failure(error), (data) {
      try {
        // Usa o adapter para converter do JSON para DTO
        final apiResponse = ApiResponseAdapter.fromJson(data);
        return Success(apiResponse.data.motels);
      } catch (e) {
        return Failure('Falha ao processar os dados: $e');
      }
    });
  }
}
