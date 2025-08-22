sealed class Result<F, S> {
  const Result();

  T when<T>(T Function(F error) whenError, T Function(S success) whenSuccess);
}

final class Failure<F, S> extends Result<F, S> {
  Failure(this._value);

  final F _value;

  @override
  T when<T>(T Function(F error) whenError, T Function(S success) whenSuccess) {
    return whenError(_value);
  }
}

final class Success<F, S> extends Result<F, S> {
  Success(this._value);

  final S _value;

  @override
  T when<T>(T Function(F error) whenError, T Function(S success) whenSuccess) {
    return whenSuccess(_value);
  }
}
