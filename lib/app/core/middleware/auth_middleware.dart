import 'package:get/get.dart';
import 'package:getx_boilerplate/app/core/export.dart';
import 'package:getx_boilerplate/app/core/services/middleware_services/session_service.dart';
import 'package:getx_boilerplate/app/core/services/middleware_services/storage_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!StorageService.to.isLoggedIn) {
      return const RouteSettings(name: Routes.LOGIN);
    }

    // كل دخول لصفحة محمية = تجديد الجلسة
    Get.find<SessionService>().refreshSession();

    return null;
  }
}
