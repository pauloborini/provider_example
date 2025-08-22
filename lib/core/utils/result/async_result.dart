import 'package:motels/core/utils/result/result.dart';

typedef AsyncResult<F, S> = Future<Result<F, S>>;

extension AsyncResultExt<F, S> on AsyncResult<F, S> {
  Future<T> when<T>(T Function(F error) whenError, T Function(S success) whenSuccess) {
    return then((value) => value.when(whenError, whenSuccess));
  }
}
