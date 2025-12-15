import 'package:getx_boilerplate/app/core/export.dart';

class HomeController extends GetxController {
 @override
  void onInit() {
    super.onInit();
    Get.find<SessionService>().refreshSession();
  }

  var count = 0.obs;
  void increment() => count++;
}
