import '/index.dart';

class IconAndTextBack extends StatelessWidget {
  const IconAndTextBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Get.offNamed(RouteHelper.getWellcom()),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.secondaryColor.withOpacity(.2),
            child: const Icon(
              size: 20,
              Icons.arrow_back_rounded,
              color: AppColors.primary,
            ),
          ),
        ),
        5.sW,
        const TextWidget(AppStrings.back)
      ],
    );
  }
}
