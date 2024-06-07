class HkHttpException implements Exception {
  final String message;

  HkHttpException(this.message);

  @override
  String toString() => message;

  factory HkHttpException.fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return HkHttpException('Bad request. Please check your request parameters.');
      case 401:
        return HkHttpException('Unauthorized. Please authenticate and try again.');
      case 403:
        return HkHttpException('Forbidden. You do not have permission to access this resource.');
      case 404:
        return HkHttpException('Not found. The requested resource could not be found.');
      case 405:
        return HkHttpException('Method not allowed. Please use a different HTTP method.');
      case 408:
        return HkHttpException('Request timeout. Please try again later.');
      case 429:
        return HkHttpException('Too many requests. Please wait and try again later.');
      case 500:
        return HkHttpException('Internal server error occurred. Please try again later.');
      case 502:
        return HkHttpException('Bad gateway. Please try again later.');
      case 503:
        return HkHttpException('Service unavailable. Please try again later.');
      case 504:
        return HkHttpException('Gateway timeout. Please try again later.');
      default:
        return HkHttpException('HTTP error: $statusCode. Please try again.');
    }
  }



  factory HkHttpException.fromMessage(String errorMessage) {
    switch (errorMessage.toLowerCase()) {
      case 'network error':
        return HkHttpException('Network error. Please check your internet connection and try again.');
      case 'server error':
        return HkHttpException('Server error. Please try again later.');
      case 'authentication failed':
        return HkHttpException('Authentication failed. Please authenticate and try again.');
      case 'invalid token':
        return HkHttpException('Invalid token. Please log in again.');
      case 'user not found':
        return HkHttpException('User not found. Please check your credentials.');
      case 'session expired':
        return HkHttpException('Session expired. Please log in again.');
      case 'unexpected server response':
        return HkHttpException('Unexpected server response. Please try again later.');
      case 'unable to connect to server':
        return HkHttpException('Unable to connect to server. Please try again later.');
    // Add more cases as needed...
      default:
        return HkHttpException(errorMessage); // Default to the provided error message
    }
  }
}