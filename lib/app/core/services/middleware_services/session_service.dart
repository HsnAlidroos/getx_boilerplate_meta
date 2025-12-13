import 'dart:async';
import 'package:get/get.dart';
import 'package:getx_boilerplate/app/core/services/middleware_services/storage_service.dart';
import 'package:getx_boilerplate/app/routes/app_pages.dart';

class SessionService extends GetxService {
  Timer? _timer;

  static const sessionDuration = Duration(minutes: 5);

  void startSession() {
    _timer?.cancel();

    _timer = Timer(sessionDuration, () {
      endSession();
    });
  }

  void refreshSession() {
    startSession();
  }

  void endSession() {
    _timer?.cancel();
    StorageService.to.logout();

    Get.offAllNamed(Routes.LOGIN);
  }
}
