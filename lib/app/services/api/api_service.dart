import 'package:get/get.dart';
import 'package:getx_boilerplate/app/core/utils/api_urls.dart';



class ApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiUrls.base;
    httpClient.timeout = const Duration(seconds: 15);
  }

  Future<Response> getData(String endpoint) => get(endpoint);
  Future<Response> postData(String endpoint, Map data) => post(endpoint, data);
}
