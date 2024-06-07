

class ApiException implements Exception {
  final int statusCode;
  final String? message;

  ApiException(this.statusCode, {this.message});

  @override
  String toString() {
    return 'ApiException: Status Code $statusCode, Message: $message';
  }
}