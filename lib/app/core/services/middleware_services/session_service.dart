import 'package:getx_boilerplate/app/core/export.dart';

class SessionService extends GetxService {
  static SessionService get to => Get.find();

  Timer? _timer;
  final Rx<Duration> remainingTime = sessionDuration.obs;

  static const sessionDuration = Duration(minutes: 5);

  @override
  void onInit() {
    super.onInit();
    startSession();
  }

  void startSession() {
    debugPrint('SessionService: starting session');
    _timer?.cancel();
    remainingTime.value = sessionDuration;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value.inSeconds > 0) {
        remainingTime.value = remainingTime.value - const Duration(seconds: 1);
        // print('SessionService: tick ${remainingTime.value}');
      } else {
        debugPrint('SessionService: session ended');
        endSession();
      }
    });
  }

  void refreshSession() {
    startSession();
  }

  void endSession() {
    _timer?.cancel();
    remainingTime.value = Duration.zero;
    StorageService.to.logout();

    Get.offAllNamed(Routes.LOGIN);
  }
}
