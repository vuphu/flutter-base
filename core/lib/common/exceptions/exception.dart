abstract class BaseException extends Error {
  final String message;

  BaseException({required this.message});
}

class ServerException extends BaseException {
  final int? statusCode;

  ServerException({
    required String message,
    this.statusCode,
  }) : super(message: message);
}

class LocalException extends BaseException {
  LocalException({required String message}) : super(message: message);
}
