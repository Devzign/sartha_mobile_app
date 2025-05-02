import 'dart:developer' as dev;

class Logger {
  static void logErrorResponse(
      String url, Map<String, String>? headers, int statusCode, dynamic body) {
    dev.log('API Error Response:',
        name: 'ApiService',
        error: 'URL: $url\nStatus Code: $statusCode\nHeaders: $headers\nBody: $body');
  }
}