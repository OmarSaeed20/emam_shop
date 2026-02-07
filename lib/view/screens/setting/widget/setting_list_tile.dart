import '../../../../index.dart';

ListTile settingListTile(IconData icon, String tit, {void Function()? onTap}) =>
    ListTile(
      onTap: onTap,
      shape:
          BeveledRectangleBorder(borderRadius: BorderRadius.circular(6.height)),
      leading: Icon(icon, color: AppColors.primary2),
      title: TextWidget(tit, fontWeight: FontWeight.w400),
      trailing:
          const Icon(Icons.keyboard_arrow_right, color: AppColors.greyDeep),
    );
