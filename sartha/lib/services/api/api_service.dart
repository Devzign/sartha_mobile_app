import 'dart:io';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService._internal()
      : _dio = Dio(BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ));

  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(url, queryParameters: params);
      return response.data;
    } catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> post(String url, {dynamic data}) async {
    try {
      final response = await _dio.post(url, data: data);
      return response.data;
    } catch (e) {
      _handleError(e);
    }
  }

  void _handleError(dynamic error) {
    if (error is DioError) {
      print('Error: \${error.response?.statusMessage ?? error.message}');
      throw Exception('API Error: \${error.response?.statusCode}');
    } else {
      throw Exception('Unexpected error: \$error');
    }
  }
}
