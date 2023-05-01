import '/index.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    return null;
  
    // if (DatabaseHelper.to.getBool("Onboarding")) {
    //   return RouteSettings(name: RouteHelper.getRegister());
    // } else if (DatabaseHelper.to.getBool("Login")) {
    //   return RouteSettings(name: RouteHelper.getMain());
    // } else {
    //   return null;
    // }
  }
}
