import 'package:getx_boilerplate/app/core/services/api/api_service.dart';
import 'package:getx_boilerplate/app/data/models/request_model.dart';

abstract class AuthRepo extends ApiService {
  Future<RequestModel> login(Map<String, dynamic> body);
  Future<RequestModel> register(Map<String, dynamic> body);
}
