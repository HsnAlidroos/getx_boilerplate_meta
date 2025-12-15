import 'package:getx_boilerplate/app/core/export.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StorageService(), permanent: true);
  }
}
