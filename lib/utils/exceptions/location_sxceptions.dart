import 'package:flutter/services.dart';

class HkLocationExceptions implements Exception {
  final String code;
  final String message;

  const HkLocationExceptions(this.code, [this.message = 'An unexpected error occurred while fetching location.']);

  factory HkLocationExceptions.fromPlatformException(PlatformException e) {
    switch (e.code) {
      case 'PERMISSION_DENIED':
        return const HkLocationExceptions('permission-denied', 'Location permission denied. Please enable location services.');
      case 'PERMISSION_DENIED_NEVER_ASK':
        return const HkLocationExceptions('permission-never-ask', 'Location permission denied permanently. Please enable location services from settings.');
      case 'SERVICE_DISABLED':
        return const HkLocationExceptions('service-disabled', 'Location services are disabled. Please enable them.');
      case 'SERVICE_STATUS_ERROR':
        return const HkLocationExceptions('service-status-error', 'Error occurred while checking location service status.');
      case 'LOCATION_DISABLED':
        return const HkLocationExceptions('location-disabled', 'Location services are disabled. Please enable them.');
      case 'LOCATION_SERVICES':
        return const HkLocationExceptions('location-services', 'Error occurred while retrieving location services.');
      case 'TIMEOUT':
        return const HkLocationExceptions('timeout', 'Location request timed out.');
      default:
        return const HkLocationExceptions('unknown-error', 'An unknown error occurred while fetching location.');
    }
  }

  @override
  String toString() {
    return 'LocationExceptions - Code: $code, Message: $message';
  }
}
