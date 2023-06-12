import '../../../../../index.dart';

Column settingHeadder(double fem) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 165.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 120,
                top: -70.height,
                child: Image.asset(
                  AppImages.vector2,
                  color: AppColors.awsmMid,
                  height: 245.height,
                  width: 188.weight,
                ),
              ),
              Positioned(
                right: 0,
                top: -70.height,
                child: Image.asset(
                  AppImages.vector,
                  height: 285.height,
                  width: 215.weight,
                ),
              ),
              Positioned(
                left: 0,
                top: -90.height,
                child: Image.asset(
                  AppImages.vector2,
                  height: 285.height,
                  width: 180.weight,
                ),
              ),
              Positioned(
                left: 133.weight,
                // right: 114.weight,
                top: 50.height,
                child: userProfileImage(),
              ),
            ],
          ),
        ),
        TextWidget(
          DatabaseHelper.to.getString(EndPoint.userName),
          fontSize: 20.weight,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
