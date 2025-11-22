import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/app/data/repositories/auth/auth_repo.dart';
import 'package:getx_boilerplate/app/routes/app_pages.dart';

import 'package:getx_boilerplate/app/core/utils/app_keys.dart';
import 'package:getx_boilerplate/app/core/utils/storage.dart';
import 'package:getx_boilerplate/app/data/models/user_model.dart';

class AuthController extends GetxController {
  final AuthRepo _authRepo = Get.find<AuthRepo>();

  // Login Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Register Controllers
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  // Observables
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;
  final isRegisterPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  void togglePasswordVisibility() => isPasswordVisible.toggle();
  void toggleRegisterPasswordVisibility() => isRegisterPasswordVisible.toggle();
  void toggleConfirmPasswordVisibility() => isConfirmPasswordVisible.toggle();

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('error_title'.tr, 'fill_all_fields'.tr,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
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
      isLoading.value = false;
    }
  }

  Future<void> register() async {
    if (registerEmailController.text.isEmpty ||
        registerPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar('error_title'.tr, 'fill_all_fields'.tr,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (registerPasswordController.text != confirmPasswordController.text) {
      Get.snackbar('error_title'.tr, 'password_mismatch'.tr,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    try {
      final response = await _authRepo.register({
        'email': registerEmailController.text,
        'password': registerPasswordController.text,
        'name': nameController.text,
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
        Get.snackbar('error'.tr, response.message ?? 'registration_failed'.tr,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('error'.tr, e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
