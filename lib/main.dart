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
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.offWhite,

          // fontFamily: 'OpenSans',
          colorScheme: const ColorScheme.highContrastLight(
              primary: AppColors.primaryColor,
              secondary: AppColors.secondaryColor)),
      home: const OnBoardingScreen(),
    );
  }
}
