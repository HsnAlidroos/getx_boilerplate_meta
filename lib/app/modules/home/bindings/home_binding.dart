import 'package:getx_boilerplate/app/core/export.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SessionService>(() => SessionService());
  }
}
