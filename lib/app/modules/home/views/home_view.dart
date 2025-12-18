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
      body: Column(children: [

        ],
      ),
    );
  }
}
