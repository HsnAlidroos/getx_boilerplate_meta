import 'package:getx_boilerplate/app/core/export.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  void increment() => count++;
}
