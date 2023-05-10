import '/index.dart';

Card banner() => Card(
        child: Stack(
      children: [
        Positioned(
            top: -20,
            right: -20,
            child: CircleAvatar(
              backgroundColor: AppColors.secondary.withOpacity(.5),
              radius: 80.height,
            )),
        Container(
          height: 150.height,
          width: double.infinity,
          // decoration: const BoxDecoration(
          //     image: DecorationImage(image: AssetImage(AppImages.sport))),
          alignment: Alignment.center,
          child: ListTile(
            title: const TextWidget(
              "A summer surprise",
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
            subtitle: Padding(
              padding: paddingOnly(top: 20),
              child: const TextWidget(
                "Cashback 20%",
                fontFamily: AppStrings.montserrat,
                color: AppColors.primary,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ],
    ));
