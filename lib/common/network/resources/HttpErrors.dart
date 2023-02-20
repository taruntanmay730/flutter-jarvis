
class HttpErrors implements Exception {
  final _message;
  final _prefix;

  HttpErrors([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends HttpErrors {
  FetchDataException([String? message]) : super(message, "Error During Communication: ");
}

class BadRequestException extends HttpErrors {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends HttpErrors {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends HttpErrors {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}