import 'package:getx_boilerplate/app/core/utils/api_urls.dart';
import 'package:getx_boilerplate/app/core/utils/http_methods.dart';
import 'package:getx_boilerplate/app/data/models/request_model.dart';
import 'package:getx_boilerplate/app/data/repositories/auth/auth_repo.dart';

class AuthRepoImple extends AuthRepo {
  @override
  Future<RequestModel> login(Map<String, dynamic> body) async {
    final response = await requestApi(
      endpoint: ApiUrls.authLogin,
      method: HttpMethods.post,
      body: body,
    );
    return RequestModel.fromJson(response.body);
  }

  @override
  Future<RequestModel> register(Map<String, dynamic> body) async {
    final response = await requestApi(
      endpoint: ApiUrls.authRegister,
      method: HttpMethods.post,
      body: body,
    );
    return RequestModel.fromJson(response.body);
  }
}
