import 'package:flutter/rendering.dart' show debugPrint;
import 'package:get/get.dart';
import 'package:getx_boilerplate/app/core/utils/api_urls.dart';
import 'package:getx_boilerplate/app/core/utils/http_methods.dart';
part 'header.dart';

class ApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiUrls.base;
    httpClient.timeout = const Duration(seconds: 15);
  }

  Future<Response> requestServer({
    required String endpoint,
    HttpMethods method = HttpMethods.get,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  })async{
   try {
      late Response response;

      switch (method) {
        case HttpMethods.get:
          response = await get(endpoint, query: query, headers: header());
          break;

        case HttpMethods.post:
          response = await post(endpoint, body, headers: headers, query: query);
          break;

        case HttpMethods.put:
          response = await put(endpoint, body, headers: headers, query: query);
          break;

        case HttpMethods.patch:
          response = await patch(endpoint, body, headers: headers, query: query);
          break;

        case HttpMethods.delete:
          response = await delete(endpoint, headers: headers, query: query);
          break;
      }

      debugPrint('🔹 [${method.name.toUpperCase()}] $endpoint');
      debugPrint('🔸 Status: ${response.statusCode}');
      debugPrint('🔸 Body: ${response.body}');

      return response;
    } catch (e) {
      debugPrint('❌ API Error: $e');
      return Response(statusCode: 500, statusText: e.toString());
    }
  }
  
}
