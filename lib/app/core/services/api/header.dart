part of 'api_service.dart';
 Map<String, String> getHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      // 'Accept-Language': lang,
    };
    return headers;
  }