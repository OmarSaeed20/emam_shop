import '/index.dart';
import 'core/shared/dependencies.dart' as dependencies;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.trans,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyLocale(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        useMaterial3: true,
        fontFamily: 'OpenSans',
        primaryColor: AppColors.primary,
        // colorScheme: const ColorScheme.highContrastLight(
        //   primary: Colors.blue,
        //   // secondary: AppColors.secondaryColor,
        // )
      ),
      locale: MyLocaleControllerImp.to.locale,
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  }
}
// Nuget.exe not found, trying to download or use cached version.