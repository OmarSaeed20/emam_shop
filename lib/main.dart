import 'package:firebase_core/firebase_core.dart';

import '/index.dart';
import 'core/shared/dependencies.dart' as dependencies;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
  await Firebase.initializeApp();
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
      theme: MyLocaleControllerImp.to.themeData,
      locale: MyLocaleControllerImp.to.locale,
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
      // home: const TestPage(),
    );
  }
}
// Nuget.exe not found, trying to download or use cached version.