import 'package:getx_boilerplate/app/core/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await LocalizationService.init();
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: CoreBinding(),
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
