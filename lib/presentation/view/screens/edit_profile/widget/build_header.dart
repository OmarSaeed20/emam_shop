import '../../../../../index.dart';

buildHeader({Widget? img, bool isSettingScreen = false}) {
  return Stack(
    children: <Widget>[
      Ink(
        height: (isSettingScreen ? 170 : 230).height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
          gradient: LinearGradient(
            colors: [
              AppColors.yelloOra,
              AppColors.primary,
            ],
          ),
        ),
      ),
      Ink(
        height: (isSettingScreen ? 120 : 180).height,
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
      ),
      Container(
        width: double.infinity,
        margin: paddingOnly(top: (isSettingScreen ? 70 : 130)),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              color: Colors.white,
              child: Container(
                width: 93.height,
                height: 93.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primarylight,
                      AppColors.yelloOra,
                    ],
                    begin: Alignment.topCenter,
                  ),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(85),
                    child: img ??
                        Image.asset(
                          AppImages.boy,
                          // "${ApiLinks.baseUri}/upload/${controller.userdata!.userImage}",
                          width: 84.weight,
                          height: 84.height,
                          fit: BoxFit.contain,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
