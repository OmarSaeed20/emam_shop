import '../../../../../index.dart';

Stack userProfileImage({bool? isEdit = false, void Function()? onTap}) {
  return Stack(
    children: [
      SizedBox(
        width: 115.weight,
        height: 115.height,
        child: Container(
          padding: paddingSymme(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(88.height),
            color: AppColors.white,
          ),
          child:
              Image.asset(AppImages.user, width: 90.weight, height: 90.height),
        ),
      ),
      if (isEdit!)
        Positioned(
          right: 7.weight,
          bottom: 7.height,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 22.height,
              width: 22.weight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.5.height),
                color: AppColors.white,
                border: Border.all(color: AppColors.grey, width: .5),
              ),
              child: Icon(Icons.photo_camera, size: 15.weight),
            ),
          ),
        )
    ],
  );
}
