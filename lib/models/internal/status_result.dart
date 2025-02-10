class StatusResult {
  final bool isSuccess;
  final String message;

  StatusResult.success(this.message) : isSuccess = true;

  StatusResult.failure(this.message) : isSuccess = false;
}
