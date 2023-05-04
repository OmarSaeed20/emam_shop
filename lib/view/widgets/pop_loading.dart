import '/index.dart';

void popLoading() {
    Get.defaultDialog(
        backgroundColor: AppColors.white,
        title: "Loadding ...",
        titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.weight),
        middleText: "",
        middleTextStyle: TextStyle(color: AppColors.grey, fontSize: 18.weight),
        barrierDismissible: false,
        radius: 6.weight,
        actions: [
          Center(
              child: Column(
            children: [
              const CircularProgressIndicator(),
              35.sH,
            ],
          ))
        ]);
  }