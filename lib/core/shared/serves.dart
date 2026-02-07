import 'package:firebase_core/firebase_core.dart';

import '../../index.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> appInit() async {
    await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().appInit());
}
