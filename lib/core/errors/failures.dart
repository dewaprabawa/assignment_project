import 'package:dartz/dartz.dart';

// Failure class represents different types of failures that can occur in the app
class Failure {
  final String message;

  Failure({required this.message});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() {
    return 'Failure: $message';
  }
}

class ServerFailure extends Failure {
  ServerFailure({String message = 'Server Error'}) : super(message: message);
}

class NetworkFailure extends Failure {
  NetworkFailure({String message = 'No Internet Connection'}) : super(message: message);
}
