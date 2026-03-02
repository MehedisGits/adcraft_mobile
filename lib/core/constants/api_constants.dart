class ApiConstants {
  // Android emulator → host machine localhost
  // iOS simulator / real device: replace with your LAN IP e.g. 'http://192.168.1.x:8000'
  static const String baseUrl = 'http://10.0.2.2:8000';

  static const String generateEndpoint = '/generate';
  static const String platformsEndpoint = '/platforms';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 60);
}
