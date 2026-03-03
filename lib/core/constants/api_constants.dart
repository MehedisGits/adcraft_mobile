class ApiConstants {
  // Android emulator → host machine localhost
  // iOS simulator / real device: replace with your LAN IP e.g. 'http://192.168.1.x:8000'
  static const String baseUrl = 'http://192.168.0.116:8000';

  static const String generateEndpoint = '/api/v1/generate';
  static const String platformsEndpoint = '/api/v1/platforms';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 120);
}
