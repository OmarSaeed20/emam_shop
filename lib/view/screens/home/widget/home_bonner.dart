import '/index.dart';

Card banner() => Card(
        child: Stack(
      children: [
        Positioned(
          top: -15,
          right: -20,
          child: Container(
            height: 180.height,
            width: 155.weight,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppImages.saell40),
                  fit: BoxFit.cover,
                )),
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
        Container(
          height: 150.height,
          width: double.infinity,
          alignment: Alignment.center,
          child: ListTile(
            title: TextWidget(
              "A summer surprise",
              fontWeight: FontWeight.w600,
              fontSize: 24.weight,
            ),
            subtitle: Padding(
              padding: paddingOnly(top: 20),
              child: TextWidget(
                "Cashback 40%",
                fontFamily: AppStrings.montserrat,
                color: AppColors.primary,
                fontSize: 30.weight,
              ),
            ),
          ),
        ),
      ],
    ));
