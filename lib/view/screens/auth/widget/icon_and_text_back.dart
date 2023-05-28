import '/index.dart';

class IconAndTextBack extends StatelessWidget {
  const IconAndTextBack({super.key, this.onTap, this.showTextBack = true, this.backgroundColor});
  final VoidCallback? onTap;
  final bool showTextBack;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: MyLocaleControllerImp.to.themeData == themeAR
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Padding(
        padding: paddingSymme(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            InkWell(
              onTap: onTap ?? () => Get.offNamed(RouteHelper.getWellcom()),
              child: CircleAvatar(
                radius: 15.height,
                backgroundColor:backgroundColor?? AppColors.secondaryLight,
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 20.weight,
                  color: AppColors.primary,
                ),
              ),
            ),
            5.sW,
            showTextBack ? TextWidget(AppStrings.back.tr) : Container()
          ],
        ),
      ),
    );
  }
}
