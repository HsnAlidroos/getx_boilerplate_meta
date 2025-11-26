
import 'dart:io';
import 'package:getx_boilerplate/app/core/export.dart';
part 'header.dart';

class ApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiUrls.base;
    httpClient.timeout = const Duration(seconds: 30);
    
    httpClient.addRequestModifier<dynamic>((request) {
      debugPrint('🔹 [${request.method.toUpperCase()}] ${request.url}');
      debugPrint('🔹 Headers: ${request.headers}');
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      debugPrint('🔸 Status: ${response.statusCode}');
      debugPrint('🔸 Body: ${response.bodyString}');
      return response;
    });
  }

  Future<Response> requestApi({
    required String endpoint,
    HttpMethods method = HttpMethods.get,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    try {
      late Response response;

      switch (method) {
        case HttpMethods.get:
          response = await get(endpoint, query: query, headers: getHeaders());
          break;

        case HttpMethods.post:
          response = await post(endpoint, body, headers: getHeaders(), query: query);
          break;

        case HttpMethods.put:
          response = await put(endpoint, body, headers: getHeaders(), query: query);
          break;

        case HttpMethods.patch:
          response = await patch(endpoint, body, headers: getHeaders(), query: query);
          break;

        case HttpMethods.delete:
          response = await delete(endpoint, headers: getHeaders(), query: query);
          break;
      }

      return response;
    } on SocketException catch (e) {
      debugPrint('❌ Network Error: $e');
      return const Response(statusCode: 0, statusText: 'No Internet Connection');
    } on TimeoutException catch (e) {
      debugPrint('❌ Timeout Error: $e');
      return const Response(statusCode: 408, statusText: 'Request Timeout');
    } catch (e) {
      debugPrint('❌ API Error: $e');
      return Response(statusCode: 500, statusText: e.toString());
    }
  }
}
