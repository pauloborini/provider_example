import 'package:motels/core/utils/result/result.dart';
import 'package:motels/features/home/datasource/home_datasource.dart';
import 'package:motels/features/home/domain/adapters/motel_adapter.dart';
import 'package:motels/features/home/domain/entities/motel_entity.dart';

abstract interface class IHomeRepository {
  Future<Result<String, List<MotelEntity>>> getMotels({
    required int page,
    required double latitude,
    required double longitude,
  });
}

class HomeRepository implements IHomeRepository {
  final IHomeDatasource _homeDatasource;

  HomeRepository({required IHomeDatasource homeDatasource}) : _homeDatasource = homeDatasource;

  @override
  Future<Result<String, List<MotelEntity>>> getMotels({
    required int page,
    required double latitude,
    required double longitude,
  }) async {
    final result = await _homeDatasource.getMotels(page: page, latitude: latitude, longitude: longitude);

    return result.when((error) => Failure(error), (dtoList) => Success(dtoList.map(MotelAdapter.toEntity).toList()));
  }
}
