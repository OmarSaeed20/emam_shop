import '/index.dart';

class IconAndTextBack extends StatelessWidget {
  const IconAndTextBack({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap ?? () => Get.offNamed(RouteHelper.getWellcom()),
          child: CircleAvatar(
            radius: 15.height,
            backgroundColor: AppColors.secondaryColor.withOpacity(.2),
            child: Icon(
              Icons.arrow_back_rounded,
              size: 20.weight,
              color: AppColors.primary,
            ),
          ),
        ),
        5.sW,
        TextWidget(AppStrings.back.tr)
      ],
    );
  }
}
