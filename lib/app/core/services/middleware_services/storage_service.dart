import 'package:getx_boilerplate/app/core/export.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  bool get isLoggedIn => box.hasData(AppKeys.userToken);

  void saveToken(String token) {
    box.write(AppKeys.userToken, token);
  }

  void logout() {
    box.remove(AppKeys.userToken);
  }

  String? get token => box.read(AppKeys.userToken);
}
