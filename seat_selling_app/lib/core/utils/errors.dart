abstract class AppError implements Exception {}

class ServerError implements AppError {
  final String message;

  ServerError(this.message);
}

class NetworkException implements AppError {}

class UnexpectedError implements AppError {}
