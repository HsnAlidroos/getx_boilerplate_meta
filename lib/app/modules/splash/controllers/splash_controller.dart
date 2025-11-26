import 'package:getx_boilerplate/app/core/export.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.SPLASH);
    });
  }
}
