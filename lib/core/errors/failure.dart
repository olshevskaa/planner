abstract class Failure {
  const Failure({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final String statusCode;

  String get errorMessage => '$statusCode Error $message';
}

class FirebaseFailure extends Failure {
  const FirebaseFailure({
    required super.message,
    required super.statusCode,
  });

  FirebaseFailure.fromException(exception)
      : this(message: exception.message.toString(), statusCode: exception.code);
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    required super.statusCode,
  });

  ServerFailure.fromException(exception)
      : this(
          message: exception.message.toString(),
          statusCode: exception.statusCode.toString(),
        );
}
