import 'package:getx_boilerplate/app/core/export.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home'.tr)),
      body: Column(
        children: [
          
        ],
      )
    );
  }
}
