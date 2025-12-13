import 'package:getx_boilerplate/app/core/export.dart';
import 'package:getx_boilerplate/app/core/services/middleware_services/session_service.dart';
import 'package:getx_boilerplate/app/core/services/middleware_services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await LocalizationService.init();
  Get.put(StorageService());
  Get.put(SessionService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Boilerplate',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeService.getThemeMode(),
      translations: LocalizationService(),
      locale: LocalizationService.currentLocale,
      fallbackLocale: LocalizationService.fallbackLocale,
    );
  }
}
