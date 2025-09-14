class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toSatring() {
    return '$_message$_prefix';
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? mesasge]) : super(mesasge, 'No Internet connection');
}

class UnauthoriedException extends AppExceptions {
  UnauthoriedException([String? mesasge]) : super(mesasge, 'You Don`t have access to this');
}

class RequestTimeOutException extends AppExceptions {
  RequestTimeOutException([String? mesasge]) : super(mesasge, 'Request Time out');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? mesasge]) : super(mesasge, '');
}
