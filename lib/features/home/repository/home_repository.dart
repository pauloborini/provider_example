import 'package:motels/core/exceptions/app_exception.dart';
import 'package:motels/core/utils/result/app_result.dart';
import 'package:motels/core/utils/result/result.dart';
import 'package:motels/features/home/datasource/home_datasource.dart';
import 'package:motels/features/home/domain/adapters/motel_adapter.dart';
import 'package:motels/features/home/domain/entities/motel_entity.dart';

abstract interface class IHomeRepository {
  AppAsyncResult<List<MotelEntity>> getMotels({
    required int page,
    required double latitude,
    required double longitude,
  });
}

class HomeRepository implements IHomeRepository {
  final IHomeDatasource _homeDatasource;

  HomeRepository({required IHomeDatasource homeDatasource}) : _homeDatasource = homeDatasource;

  @override
  AppAsyncResult<List<MotelEntity>> getMotels({
    required int page,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final motelDTOs = await _homeDatasource.getMotels(
        page: page,
        latitude: latitude,
        longitude: longitude,
      );
      final motels = motelDTOs.map((dto) => MotelAdapter.toEntity(dto)).toList();
      return Success(motels);
    } catch (e) {
      if (e is AppException) {
        return Failure(e);
      }
      return Failure(const AppException('Erro ao buscar motéis'));
    }
  }
}
