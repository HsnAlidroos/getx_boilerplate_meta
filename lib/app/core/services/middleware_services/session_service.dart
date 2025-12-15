
import 'package:getx_boilerplate/app/core/export.dart';

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
