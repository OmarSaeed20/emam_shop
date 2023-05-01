import 'dart:developer';

import '/index.dart';

abstract class LocaleController extends GetxController {
  void onChangeLang(String languageCode);
  void updateLocale(Locale locale);
}

class MyLocaleControllerImp extends LocaleController {
  static MyLocaleControllerImp get to => Get.find();
  late Locale _locale;
  Locale get locale => _locale;

  // ThemeData _themeData = themeEn;
  // ThemeData get themeData => _themeData;

  @override
  void onChangeLang(String languageCode) {
    _locale = Locale(languageCode);
    DatabaseHelper.to.setString(languageCode, languageCode);
    // _themeData = languageCode == 'ar' ? themeAr : themeEn;

    update();
  }

  @override
  void updateLocale(Locale locale) {
    Get.updateLocale(locale);
    // Get.changeTheme(_themeData);
    // Get.offNamedUntil(RouteHelper.getOnboarding(), (route) => false);
    DatabaseHelper.to.setBool("onboarding", true);
    Get.back();
    update();
  }

  @override
  void onInit() {
    // NotificationHelper.initialize();
    log(DatabaseHelper.to.getString("languageCode"));
    String langCode = DatabaseHelper.to.getString("languageCode");
    if (langCode == 'ar') {
      _locale = const Locale('ar');
      // _themeData = themeAr;
    } else if (langCode == 'en') {
      _locale = const Locale('en');
      // _themeData = themeEn;
    } else {
      _locale = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}


/*class MyLocaleController extends GetxController {
  static MyLocaleController get to => Get.find();

  late Locale _locale;
  Locale get locale => _locale;
  void changeLang(String codeLacg) {
    _locale = Locale(codeLacg);
    Get.updateLocale(_locale);
  }

  bool _value = false;
  get switchlang => _value;
  void switchLang() {
    if (_value = !_value) {
      DatabaseHelper.to.setString("ar", "ar");
      changeLang("ar");
    } else {
      changeLang("en");
      DatabaseHelper.to.setString("en", "en");
    }

    update();
  }

  @override
  void onInit() {
    String langCode = DatabaseHelper.to.getString("languageCode");
    if (langCode == 'ar') {
      _locale = const Locale('ar');
      _value = !_value;
    } else if (langCode == 'en') {
      _locale = const Locale('en');
      _value = _value;
    } else {
      _locale = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}*/
