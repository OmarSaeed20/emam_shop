import 'package:ecommerce/index.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void warningAwsomeDialog(
  BuildContext context, {
  void Function()? btnOkOnPress,
  void Function()? btnCancelOnPress,
  String? title,
  String? info,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    headerAnimationLoop: false,
    animType: AnimType.topSlide,
    title: title ?? 'Warning',
    desc: info ?? 'Are you sure you want to delete the item',
    btnCancelOnPress: btnCancelOnPress,
    btnOkOnPress: btnOkOnPress,
  ).show();
}
