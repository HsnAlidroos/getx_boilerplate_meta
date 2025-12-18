import 'package:getx_boilerplate/app/core/export.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put<AuthRepo>(AuthRepoImple());
    Get.put(StorageService(), permanent: true);
  }
}
