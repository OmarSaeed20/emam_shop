import '/index.dart';

dialogBtn(String title, {required void Function() onTap}) => BtnWidget(
      title,
      width: 120.weight,
      onPressed: onTap,
      backgroundColor: AppColors.trans,
      color: AppColors.black,
      border: BorderSide(color: AppColors.primary, width: .5.weight),
    );

dialogBody({
  required Widget btn1,
  required Widget btn2,
  required IconData icon,
  double? icSize,
  Widget? sH,
}) =>
    SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Icon(
            icon,
            size: icSize ?? 120.weight,
            color: AppColors.primary,
          ),
          sH ?? 40.sH,
          Padding(
            padding: paddingSymme(horizontal: 2),
            child: Row(
              children: [
                btn1,
                15.sW,
                btn2,
              ],
            ),
          ),
          10.sH,
        ],
      ),
    );
