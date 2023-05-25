import '/index.dart';

class HomeBanner extends GetView<HomeControllerImp> {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0.height),
        ),
        color: AppColors.cardColor,
        child: Stack(
          children: [
            Container(
              height: 110.height,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.height),
              ),
              child: ListTile(
                title: TextWidget(
                  "A summer surprise",
                  fontWeight: FontWeight.w600,
                  fontSize: 22.weight,
                ),
                subtitle: Padding(
                  padding: paddingOnly(top: 5.height),
                  child: TextWidget(
                    "Cashback 40%",
                    fontFamily: AppStrings.montserrat,
                    color: AppColors.primary,
                    fontSize: 28.weight,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -15,
              right: controller.lang == EndPoint.enCode ? -20 : null,
              left: controller.lang == EndPoint.arCode ? -20 : null,
              child: Container(
                height: 140.height,
                width: 155.weight,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AppImages.saell40),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -20,
              left: -20,
              child: CircleAvatar(
                backgroundColor: AppColors.awsmLight.withOpacity(.2),
                radius: 60.height,
              ),
            ),
            Positioned(
              bottom: -50,
              left: 100,
              child: CircleAvatar(
                backgroundColor: AppColors.successLightBack.withOpacity(.2),
                radius: 60.height,
              ),
            ),
          ],
        ));
  }
}
