import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/app/core/theme/app_colors.dart';
import 'package:getx_boilerplate/app/core/widgets/custom_button.dart';
import 'package:getx_boilerplate/app/core/widgets/custom_text_field.dart';
import 'package:getx_boilerplate/app/modules/auth/controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'create_account'.tr,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'sign_up_started'.tr,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                hintText: 'email_hint'.tr,
                controller: controller.registerEmailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(height: 16),
              GetBuilder<RegisterController>(
                builder: (controller) => CustomTextField(
                  hintText: 'password_hint'.tr,
                  controller: controller.registerPasswordController,
                  isPassword: !controller.isRegisterPasswordVisible,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isRegisterPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: controller.toggleRegisterPasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GetBuilder<RegisterController>(
                builder: (controller) => CustomTextField(
                  hintText: 'confirm_password_hint'.tr,
                  controller: controller.confirmPasswordController,
                  isPassword: !controller.isConfirmPasswordVisible,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isConfirmPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: controller.toggleConfirmPasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              GetBuilder<RegisterController>(
                builder: (controller) => CustomButton(
                  text: 'sign_up_button'.tr,
                  onPressed: controller.register,
                  isLoading: controller.isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
