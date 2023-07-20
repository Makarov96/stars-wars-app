import 'package:equatable/equatable.dart';

class GenericException implements Exception, Equatable {
  GenericException([
    this.message = '',
    this.prefix = '',
  ]);
  final String message;
  final String prefix;
  @override
  List<Object> get props => [message, prefix];

  @override
  bool get stringify => true;

  @override
  String toString() {
    return 'GenericException(prefix:$prefix,message:$message)';
  }
}

class ServerException extends GenericException {
  ServerException([String message = ''])
      : super(message, 'Error During Communication: ');
}

class InternetException extends GenericException {
  InternetException([String message = ''])
      : super(message, 'Error During Communication: ');
}

class LocalDataException extends GenericException {
  LocalDataException([String message = ''])
      : super(message, 'Error During Communication: ');
}

class FetchDataException extends GenericException {
  FetchDataException([String message = ''])
      : super(message, 'Error During Communication: ');
}

class BadRequestException extends GenericException {
  BadRequestException([String message = ''])
      : super(message, 'Invalid Request:');
}

class UnauthorisedException extends GenericException {
  UnauthorisedException([String message = ''])
      : super(message, 'Unauthorised:');
}

class InvalidInputException extends GenericException {
  InvalidInputException([String message = ''])
      : super(message, 'Invalid Input:');
}

class NetworkException extends GenericException {
  NetworkException([String message = ''])
      : super(message, 'Network Failure Internet Connection:');
}
