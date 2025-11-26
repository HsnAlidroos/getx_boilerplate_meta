import 'package:getx_boilerplate/app/core/export.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('app_title'.tr, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
