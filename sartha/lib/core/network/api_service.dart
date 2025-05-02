import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../services/logger.dart';
import '../constants/api_const.dart';

class ApiService {
  static final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // ✅ GET
  static Future<dynamic> get(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse('${ApiConfig.baseUrl}$endpoint');
    final currentHeaders = headers ?? _defaultHeaders;
    final response = await http.get(url, headers: currentHeaders);
    return _handleResponse(url.toString(), currentHeaders, response);
  }

  // ✅ POST
  static Future<dynamic> post(
    String endpoint,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse('${ApiConfig.baseUrl}$endpoint');
    final currentHeaders = headers ?? _defaultHeaders;
    final response = await http.post(
      url,
      headers: currentHeaders,
      body: jsonEncode(body),
    );
    return _handleResponse(url.toString(), currentHeaders, response);
  }

  // ✅ PUT
  static Future<dynamic> put(
    String endpoint,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse('${ApiConfig.baseUrl}$endpoint');
    final currentHeaders = headers ?? _defaultHeaders;
    final response = await http.put(
      url,
      headers: currentHeaders,
      body: jsonEncode(body),
    );
    return _handleResponse(url.toString(), currentHeaders, response);
  }

  // ✅ DELETE
  static Future<dynamic> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse('${ApiConfig.baseUrl}$endpoint');
    final currentHeaders = headers ?? _defaultHeaders;
    final response = await http.delete(url, headers: currentHeaders);
    return _handleResponse(url.toString(), currentHeaders, response);
  }

  // ✅ Common Response Handler
  static dynamic _handleResponse(
    String url,
    Map<String, String>? headers,
    http.Response response,
  ) {
    final statusCode = response.statusCode;
    dynamic body;
    String errorMessage = 'HTTP Error $statusCode';

    if (response.body.isNotEmpty) {
      try {
        body = jsonDecode(response.body);
        if (body is Map && body.containsKey('message')) {
          errorMessage = '$errorMessage: ${body['message']}';
        } else {
          errorMessage = '$errorMessage: ${response.body}';
        }
      } catch (e) {
        errorMessage =
            '$errorMessage: ${response.body} (Failed to decode JSON)';
        body = response.body;
      }
    }

    if (statusCode >= 200 && statusCode < 300) {
      return body;
    } else {
      Logger.logErrorResponse(url, headers, statusCode, body);
      if (statusCode == 400) {
        throw BadRequestException(errorMessage);
      } else if (statusCode == 401) {
        throw UnauthorizedException(errorMessage);
      } else if (statusCode == 403) {
        throw ForbiddenException(errorMessage);
      } else if (statusCode == 404) {
        throw NotFoundException(errorMessage);
      } else if (statusCode >= 500) {
        throw ServerErrorException(errorMessage);
      } else {
        throw ApiException(errorMessage);
      }
    }
  }

  // ✅ GET for Full URL (bypasses baseUrl)
  static Future<dynamic> getFullUrl(
    String fullUrl, {
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse(fullUrl);
    final currentHeaders = headers ?? _defaultHeaders;
    final response = await http.get(url, headers: currentHeaders);
    return _handleResponse(fullUrl, currentHeaders, response);
  }
}

// Custom Exception Classes for better error handling
class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() {
    return 'API Exception: $message';
  }
}

class BadRequestException extends ApiException {
  BadRequestException(String message) : super(message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(String message) : super(message);
}

class ForbiddenException extends ApiException {
  ForbiddenException(String message) : super(message);
}

class NotFoundException extends ApiException {
  NotFoundException(String message) : super(message);
}

class ServerErrorException extends ApiException {
  ServerErrorException(String message) : super(message);
}
