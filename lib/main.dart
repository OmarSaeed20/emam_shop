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
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.offWhite,
          fontFamily: 'Montserrat',
          colorScheme: const ColorScheme.highContrastLight(
              primary: AppColors.primaryColor,
              secondary: AppColors.secondaryColor),
          // textTheme: TextTheme(
          //     headline1: TextStyle(
          //   fontSize: getProportionateScreenWidth(19),
          //   fontWeight: FontWeight.w700,
          //   // color: AppColors.black,
          // ))
          ),
      routes: routs,
      // initialRoute: RouteHelper.initial,
      // getPages: RouteHelper.routes,
    );
  }
}
