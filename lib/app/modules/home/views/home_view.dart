import 'package:getx_boilerplate/app/core/export.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
        actions: [
          IconButton(
            onPressed: () {
              StorageService.to.logout();
              Get.offAllNamed(Routes.LOGIN);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Obx(() {
            final duration = SessionService.to.remainingTime.value;
            final minutes = duration.inMinutes.toString().padLeft(2, '0');
            final seconds = (duration.inSeconds % 60).toString().padLeft(
              2,
              '0',
            );
            return Text(
              'Time Remaining: $minutes:$seconds',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            );
          }),
        ],
      ),
    );
  }
}
