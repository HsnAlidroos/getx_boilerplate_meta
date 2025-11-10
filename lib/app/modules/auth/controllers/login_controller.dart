import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void submit() {
    // fake login: go to home
    Get.offAllNamed('/home');
  }
}
