import 'package:getx_boilerplate/app/core/export.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (!StorageService.to.isLoggedIn) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}
