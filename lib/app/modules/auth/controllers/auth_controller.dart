import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/app/routes/app_pages.dart';

class AuthController extends GetxController {
  // Login Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Register Controllers
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
    await Future.delayed(const Duration(seconds: 2)); // Simulate API call
    isLoading.value = false;
    
    Get.offAllNamed(Routes.HOME);
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
    await Future.delayed(const Duration(seconds: 2)); // Simulate API call
    isLoading.value = false;

    Get.snackbar('success_title'.tr, 'account_created'.tr,
        snackPosition: SnackPosition.BOTTOM);
    Get.offAllNamed(Routes.HOME);
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
