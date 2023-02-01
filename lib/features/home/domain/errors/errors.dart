class Failure implements Exception {}

class HttpError extends Failure {
  final String _message;
  HttpError(this._message);

  @override
  String toString() {
    return _message;
  }
}
