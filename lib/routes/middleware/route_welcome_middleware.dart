import '/index.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    DatabaseHelper database = Get.find();
    String step = database.getString(EndPoint.step);
    
    if (step == EndPoint.login) {
      return RouteSettings(name: RouteHelper.getMain());
    }
    if (step == EndPoint.onboard) {
      return RouteSettings(name: RouteHelper.getWellcom());
    }
    return null;
    /* if (database.getBool(EndPoint.onboarding) == true) {
      return RouteSettings(name: RouteHelper.getWellcom());
    } else if (database.getBool(EndPoint.login) == true) {
      return RouteSettings(name: RouteHelper.getMain());
    } else {
      return null;
    } */
  }
}
