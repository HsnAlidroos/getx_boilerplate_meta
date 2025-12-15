import 'package:getx_boilerplate/app/core/export.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();
// استخدمت box المشترك 
  GetStorage get _box => box;

  bool get isLoggedIn => _box.hasData('token');

  void saveToken(String token) {
    _box.write('token', token);
  }

  void logout() {
    _box.remove('token');
  }

  String? get token => _box.read('token');
}
