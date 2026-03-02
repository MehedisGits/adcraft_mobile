class ApiException implements Exception {
  final int statusCode;
  final String message;

  const ApiException({required this.statusCode, required this.message});

  @override
  String toString() => 'ApiException($statusCode): $message';

  String get userMessage {
    switch (statusCode) {
      case 0:
        return 'Cannot connect to server. Check your network connection.';
      case 422:
        return 'Invalid input. Please check your form fields.';
      case 429:
        return 'Too many requests. Please wait a moment and try again.';
      case 500:
      case 502:
      case 503:
        return 'Server error. Please try again in a moment.';
      default:
        return message.isNotEmpty ? message : 'Something went wrong. Please try again.';
    }
  }
}
