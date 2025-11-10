import 'package:get/get.dart';

class ApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ''; 
    httpClient.timeout = const Duration(seconds: 15);
  }

  Future<Response> getData(String endpoint) => get(endpoint);
  Future<Response> postData(String endpoint, Map data) => post(endpoint, data);
}
