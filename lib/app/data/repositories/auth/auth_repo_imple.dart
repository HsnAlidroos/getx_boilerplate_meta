import 'package:getx_boilerplate/app/core/export.dart';
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
