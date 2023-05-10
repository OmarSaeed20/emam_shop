import 'dart:developer';

import '/index.dart';

abstract class LocaleController extends GetxController {
  void onChangeLang(String languageCode);
  void updateLocale(Locale locale);
  void initLang();
}

class MyLocaleControllerImp extends LocaleController {
  static MyLocaleControllerImp get to => Get.find();
  Locale? _locale;
  Locale? get locale => _locale;

  ThemeData _themeData = themeEN;
  ThemeData get themeData => _themeData;
  DatabaseHelper database = Get.find();
  @override
  void onChangeLang(String languageCode) {
    _locale = Locale(languageCode);
    database.setString(EndPoint.lang, languageCode);
    _themeData = languageCode == EndPoint.arCode ? themeAR : themeEN;
    // DatabaseHelper.to.setBool(EndPoint.onboarding, true);
    database.setString(EndPoint.step, EndPoint.onboard);

    Get.back();
    Get.changeTheme(_themeData);
    Get.updateLocale(_locale!);
    update();
  }

  @override
  void updateLocale(Locale locale) {
    Get.updateLocale(locale);
    Get.changeTheme(_themeData);
    // database.setBool(EndPoint.onboarding, true);
    database.setString(EndPoint.step, EndPoint.onboard);
    Get.back();
    update();
  }

  @override
  void initLang() {
    String? langCode = database.getString(EndPoint.lang);
    if (langCode == EndPoint.arCode) {
      _locale = const Locale(EndPoint.arCode);
      _themeData = themeAR;
    } else if (langCode == EndPoint.enCode) {
      _locale = const Locale(EndPoint.enCode);
      _themeData = themeEN;
    } else {
      _locale = Locale(Get.deviceLocale!.languageCode);
      _themeData = themeEN;
    }
  }

  @override
  void onInit() {
    // NotificationHelper.initialize();
    log(database.getString(EndPoint.lang));
    initLang();
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
