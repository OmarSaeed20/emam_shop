import '/index.dart';

class ChooseLang extends StatelessWidget {
  const ChooseLang({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyLocaleControllerImp localeContro = Get.find();
    return Column(
      children: [
        CircleAvatar(
            radius: 60.weight,
            backgroundColor: AppColors.trans,
            child: Icon(
              Icons.translate_outlined,
              size: 120.weight,
              color: AppColors.primary,
            )),
        50.sH,
        10.sH,
        Row(
          children: [
            2.sW,
            _choseLangBtn(
              AppStrings.arabic.tr,
              onTap: () => localeContro.onChangeLang(EndPoint.arCode),
            ),
            15.sW,
            _choseLangBtn(
              AppStrings.english.tr,
              onTap: () => localeContro.onChangeLang(EndPoint.enCode),
            ),
            2.sW,
          ],
        ),
        10.sH,
      ],
    );
  }

  _choseLangBtn(String lang, {required void Function() onTap}) {
    return BtnWidget(
      lang,
      width: 120.weight,
      onPressed: onTap,
      backgroundColor: AppColors.trans,
      color: AppColors.black,
      border: BorderSide(color: AppColors.primary, width: .5.weight),
    );
  }
}
