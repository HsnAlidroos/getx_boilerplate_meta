import 'package:getx_boilerplate/app/core/export.dart';

class RegisterController extends GetxController {
  final AuthRepo _authRepo = Get.find<AuthRepo>();

  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  bool isLoading = false;
  bool isRegisterPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void toggleRegisterPasswordVisibility() {
    isRegisterPasswordVisible = !isRegisterPasswordVisible;
    update();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    update();
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

    isLoading = true;
    update();
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
      isLoading = false;
      update();
    }
  }

  @override
  void onClose() {
    registerEmailController.dispose();
    registerPasswordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
