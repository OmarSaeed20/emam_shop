import '../../../../index.dart';

addUserData({
  required String title,
  required String img,
  required void Function() onTap,
}) {
  return Container(
    color: AppColors.grey100,
    child: ListTile(
      onTap: onTap,
      title: TextWidget(
        title,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      leading: Container(
        height: 35.height,
        width: 38.weight,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(img))),
      ),
      trailing: Icon(
        DatabaseHelper.to.getString(EndPoint.lang) == EndPoint.enCode
            ? Icons.keyboard_arrow_right_sharp
            : Icons.keyboard_arrow_left_sharp,
        color: AppColors.primary2,
      ),
    ),
  ).animate().scaleY();
}
