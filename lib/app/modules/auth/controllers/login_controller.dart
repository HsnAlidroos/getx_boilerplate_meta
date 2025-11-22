import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/app/core/utils/app_keys.dart';
import 'package:getx_boilerplate/app/core/utils/storage.dart';
import 'package:getx_boilerplate/app/data/models/user_model.dart';
import 'package:getx_boilerplate/app/data/repositories/auth/auth_repo.dart';
import 'package:getx_boilerplate/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthRepo _authRepo = Get.find<AuthRepo>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('error_title'.tr, 'fill_all_fields'.tr,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading = true;
    update();
    try {
      final response = await _authRepo.login({
        'email': emailController.text,
        'password': passwordController.text,
      });

      if (response.status == 200) {
        final user = UserModel.fromJson(response.data);
        if (user.token != null) {
          box.write(AppKeys.userToken, user.token);
        }

        if (user.isVerify == true) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.toNamed(Routes.VERIFY);
        }
      } else {
        Get.snackbar('error'.tr, response.message ?? 'login_failed'.tr,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('error'.tr, e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading = false;
      update();
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
