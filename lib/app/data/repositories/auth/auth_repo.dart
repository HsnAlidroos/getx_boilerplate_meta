import 'package:getx_boilerplate/app/core/export.dart';

abstract class AuthRepo extends ApiService {
  Future<RequestModel> login(Map<String, dynamic> body);
  Future<RequestModel> register(Map<String, dynamic> body);
}
