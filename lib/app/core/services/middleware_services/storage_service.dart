import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  final GetStorage _box = GetStorage();

  bool get isLoggedIn => _box.hasData('token');

  void saveToken(String token) {
    _box.write('token', token);
  }

  void logout() {
    _box.remove('token');
  }

  String? get token => _box.read('token');
}
