import 'package:ecommerce/index.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void onlyInfoAwesomeDialog(
  BuildContext context, {
  String? title,
  String? info,
}) {
  AwesomeDialog(
    context: context,
    headerAnimationLoop: false,
    dialogType: DialogType.info,
    animType: AnimType.bottomSlide,
    title: title ?? 'Information',
    desc: info ?? 'The operation was successfully completed.',
  ).show();
}
