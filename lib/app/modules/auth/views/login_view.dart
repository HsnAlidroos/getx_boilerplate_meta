import 'package:getx_boilerplate/app/core/export.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'welcome_back'.tr,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'sign_in_continue'.tr,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                hintText: 'email_hint'.tr,
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(height: 16),
              GetBuilder<LoginController>(
                builder: (controller) => CustomTextField(
                  hintText: 'password_hint'.tr,
                  controller: controller.passwordController,
                  isPassword: !controller.isPasswordVisible,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              GetBuilder<LoginController>(
                builder: (controller) => CustomButton(
                  text: 'login_button'.tr,
                  onPressed: controller.login,
                  isLoading: controller.isLoading,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'no_account'.tr,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.REGISTER),
                    child: Text(
                      'sign_up'.tr,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
