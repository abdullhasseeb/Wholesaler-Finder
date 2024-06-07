import 'package:dio/dio.dart';

/// Custom exception class to handle Dio errors.
class HkDioException implements Exception {
  /// The error message associated with the exception.
  final String message;

  /// Constructor that takes an error message.
  HkDioException(this.message);

  @override
  String toString() => message;

  /// Factory method to create a DioExceptionHandler from a DioError.
  factory HkDioException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return HkDioException('Request cancelled');
      case DioExceptionType.connectionTimeout:
        return HkDioException('Connection timeout. Please check your internet connection and try again.');
      case DioExceptionType.sendTimeout:
        return HkDioException('Send timeout occurred. Please try again.');
      case DioExceptionType.receiveTimeout:
        return HkDioException('Receive timeout occurred. Please try again.');
      case DioExceptionType.connectionError:
        return HkDioException('Please connect with internet');
      case DioExceptionType.badResponse:
      // Handle DioErrorType.response for non-2xx status codes
        final statusCode = dioError.response?.statusCode ?? -1;
        switch (statusCode) {
          case 400:
            return HkDioException('Bad request. Please check your request parameters.');
          case 401:
            return HkDioException('Unauthorized. Please authenticate and try again.');
          case 403:
            return HkDioException('Forbidden. You do not have permission to access this resource.');
          case 404:
            return HkDioException('Not found. The requested resource could not be found.');
          case 500:
            return HkDioException('Internal server error occurred. Please try again later.');
          default:
            return HkDioException('HTTP error: $statusCode. Please try again.');
        }
      case DioExceptionType.unknown:
      // Handle other DioErrorType.other errors
        return HkDioException('An unexpected error occurred. Please try again.');
      default:
        return HkDioException('An unexpected error occurred. Please try again.');
    }
  }
}
