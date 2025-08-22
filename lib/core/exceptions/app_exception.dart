class AppException implements Exception {
  const AppException(
    this.message, {
    this.code,
    this.originalError,
    this.stackTrace,
  });
  final String message;
  final String? code;
  final dynamic originalError;
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'AppException: $message${code != null ? ' (Code: $code)' : ''}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppException && other.message == message && other.code == code;
  }

  @override
  int get hashCode => Object.hash(message, code);
}
