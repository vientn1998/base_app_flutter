class NetworkException implements Exception{
  String message;
  int statusCode;
  NetworkException({this.message, this.statusCode});
}

class AuthException extends NetworkException {
  AuthException({message, status}): super(message: message, statusCode: status);
}