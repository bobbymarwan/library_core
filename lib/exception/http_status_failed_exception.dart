class HTTPStatusFailedException implements Exception {
  HTTPStatus get type => _type();
  String _message = 'Unknown Error';
  String get message => message;
  int _errorCode = -1;
  int get errorCode => _errorCode;
  String? _responseBody;
  String? get responseBody => _responseBody;

  HTTPStatusFailedException({String? message, int? errorCode, String? responseBody}) {
    _message = message ?? 'Unknown Error' ;
    _errorCode = errorCode ?? -1;
    _responseBody = responseBody;
  }

  HTTPStatus _type() {
    if(_errorCode >= 500) {
      return HTTPStatus.server_error;
    } else if (_errorCode == 404) {
      return HTTPStatus.not_found;
    } else if (_errorCode == 401 || _errorCode == 403) {
      return HTTPStatus.token_expired;
    } else if (_errorCode >= 400) {
      return HTTPStatus.bad_request;
    } else if (_errorCode >= 200) {
      return HTTPStatus.success;
    } else {
      return HTTPStatus.unknown;
    }
  }

  @override
  String toString() {
    return _message;
  }
}

enum HTTPStatus {
  success,
  timeout,
  server_error,
  token_expired,
  bad_request,
  not_found,
  unknown
}