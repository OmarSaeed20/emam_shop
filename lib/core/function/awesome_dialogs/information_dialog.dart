import 'package:ecommerce/index.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void informationAwesomeDialog(
  BuildContext context, {
  String? title,
  String? info,
  required VoidCallback btnCancelOnPress,
}) {
  AwesomeDialog(
    context: context,
    headerAnimationLoop: false,
    dialogType: DialogType.info,
    animType: AnimType.bottomSlide,
    title: title ?? 'Information',
    desc: info ?? 'The operation was successfully completed.',
    btnCancelOnPress: btnCancelOnPress,
  ).show();
}
