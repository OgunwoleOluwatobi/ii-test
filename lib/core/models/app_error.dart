class AppError {
  final AppErrorType? errorType;
  final String? message;

  const AppError({this.errorType, this.message});
}

enum AppErrorType { api, network }