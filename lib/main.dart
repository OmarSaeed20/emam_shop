import '/index.dart';
import 'core/shared/dependencies.dart' as dependencies;
 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* ErrorWidget.builder = (FlutterErrorDetails details) {
    if (kDebugMode) {
      return Center(child: ErrorWidget(details.exception));
    } else {
      // Display user-friendly error widget in release mode
      return const Center(
        child: TextWidget('An error occurred'),
      );
    }
  }; */
  await dependencies.init();
  await initialServices();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.trans,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    const MyApp(),
    /* DevicePreview(
     enabled: true,
      builder: (context) => const MyApp(), // Wrap your app
    ), */
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      /* // DevicePreview
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // */
      translations: MyLocale(),
      theme: MyLocaleControllerImp.to.themeData,
      locale: MyLocaleControllerImp.to.locale,
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
      // home: const TestPage(),
    );
  }
}
// Nuget.exe not found, trying to download or use cached version.