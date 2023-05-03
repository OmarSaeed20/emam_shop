import '/index.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (DatabaseHelper.to.getBool(EndPoint.onboarding) == true) {
      return RouteSettings(name: RouteHelper.getWellcom());
    } else if (DatabaseHelper.to.getBool(EndPoint.login)) {
      return RouteSettings(name: RouteHelper.getMain());
    } else {
      return null;
    }
  }
}
