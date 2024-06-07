class HkTimeoutException implements Exception {
  final String message;

  HkTimeoutException(this.message);

  @override
  String toString() => message;

  factory HkTimeoutException.fromCase(String caseName) {
    switch (caseName) {
      case 'network':
        return HkTimeoutException('Network connection timed out. Please check your internet connection and try again.');
      case 'server':
        return HkTimeoutException('Server took too long to respond. Please try again later.');
      case 'operation':
        return HkTimeoutException('Operation timed out. Please try again.');
      case 'custom':
        return HkTimeoutException('Custom timeout message goes here.');
      case 'file':
        return HkTimeoutException('File download/upload timed out. Please try again.');
      case 'resource':
        return HkTimeoutException('Resource loading timed out. Please check your internet connection and try again.');
      case 'session':
        return HkTimeoutException('Session timeout. Please log in again.');
      default:
        return HkTimeoutException('Timeout occurred. Please try again.');
    }
  }
}