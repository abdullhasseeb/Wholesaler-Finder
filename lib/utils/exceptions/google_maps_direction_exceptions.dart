/// Custom exception class to handle various Google Maps Direction API errors.
class HkGoogleMapsDirectionException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  HkGoogleMapsDirectionException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'invalid-request':
        return 'The request is invalid. Please check your request parameters and try again.';
      case 'max-waypoints-exceeded':
        return 'The maximum number of waypoints for a Directions API request has been exceeded.';
      case 'over-query-limit':
        return 'The request exceeds the usage limits for the Directions API.';
      case 'request-denied':
        return 'The Directions API request was denied.';
      case 'unknown-error':
        return 'An unknown error occurred. Please try again later.';
      case 'zero-results':
        return 'No routes were found between the origin and destination.';
      case 'not-found':
        return 'The requested route cannot be found.';
      case 'max-route-length-exceeded':
        return 'The requested route is too long and cannot be processed.';
      case 'max-elements-exceeded':
        return 'The number of waypoints exceeds the maximum allowed.';
      case 'invalid-api-key':
        return 'The provided API key is invalid.';
      case 'api-not-activated':
        return 'The provided API key has not been activated.';
      case 'invalid-directions-request':
        return 'The Directions API request is invalid.';
      case 'over-daily-limit':
        return 'The Directions API request has exceeded the daily limit.';
      case 'over-query-limit':
        return 'The Directions API request has exceeded the query limit.';
      case 'billing-not-enabled':
        return 'Billing has not been enabled on your account.';
      case 'user-rate-limit-exceeded':
        return 'The user rate limit has been exceeded.';
      case 'keyless-access-not-allowed':
        return 'Keyless access is not allowed. You must enable API key restrictions.';
      case 'access-not-configured':
        return 'The API key provided does not have access to the Google Maps Direction API.';
    // Add more cases for other possible error codes as needed
      default:
        return 'An unexpected error occurred while processing the request.';
    }
  }
}
