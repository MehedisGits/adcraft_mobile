import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';
import '../../core/errors/api_exception.dart';
import '../models/generate_request.dart';
import '../models/generate_response.dart';

class AdcraftService {
  late final Dio _dio;

  AdcraftService() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: {'Content-Type': 'application/json'},
    ));

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  Future<GenerateResponse> generate(GenerateRequest request) async {
    try {
      final response = await _dio.post(
        ApiConstants.generateEndpoint,
        data: request.toJson(),
      );
      return GenerateResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<List<String>> getPlatforms() async {
    try {
      final response = await _dio.get(ApiConstants.platformsEndpoint);
      return List<String>.from(response.data as List);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  ApiException _mapDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return const ApiException(statusCode: 0, message: 'Connection failed');
    }
    final statusCode = e.response?.statusCode ?? 0;
    final message = _extractMessage(e.response?.data) ?? e.message ?? 'Unknown error';
    return ApiException(statusCode: statusCode, message: message);
  }

  String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['detail']?.toString() ?? data['message']?.toString();
    }
    return data?.toString();
  }
}
