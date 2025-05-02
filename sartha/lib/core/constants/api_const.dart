enum Environment { dev, staging, production }

class ApiConfig {
  static const _devBaseUrl = 'https://dev.example.com/api/';
  static const _stagingBaseUrl = 'https://staging.example.com/api/';
  static const _productionBaseUrl = 'https://prod.example.com/api/';

  static Environment currentEnv = Environment.dev;

  static String get baseUrl {
    switch (currentEnv) {
      case Environment.dev:
        return _devBaseUrl;
      case Environment.staging:
        return _stagingBaseUrl;
      case Environment.production:
        return _productionBaseUrl;
    }
  }
}
