
import '/index.dart';

class ChooseLang extends StatelessWidget {
  const ChooseLang({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyLocaleControllerImp localeContro = Get.find();
    return dialogBody(
        icon: Icons.translate_outlined,
        btn1: dialogBtn(
          AppStrings.arabic.tr,
          onTap: () => localeContro.onChangeLang(EndPoint.arCode),
        ),
        btn2: dialogBtn(
          AppStrings.english.tr,
          onTap: () => localeContro.onChangeLang(EndPoint.enCode),
        ));
  }
}
