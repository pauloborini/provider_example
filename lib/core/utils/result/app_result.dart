import 'package:motels/core/exceptions/app_exception.dart';
import 'package:motels/core/utils/result/async_result.dart';

typedef AppAsyncResult<S> = AsyncResult<AppException, S>;
