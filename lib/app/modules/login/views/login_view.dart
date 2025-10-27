import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../../../services/localization_service.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('app_title'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'email'.tr),
              onChanged: (v) => controller.email.value = v,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'password'.tr),
              obscureText: true,
              onChanged: (v) => controller.password.value = v,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.submit,
              child: Text('login'.tr),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('English'),
                Switch(
                  value: Get.locale?.languageCode == 'ar',
                  onChanged: (v) {
                    final code = v ? 'ar' : 'en';
                    LocalizationService.changeLocale(code);
                  },
                ),
                const Text('العربية'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
