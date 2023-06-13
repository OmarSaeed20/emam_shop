import 'package:ecommerce/index.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void errorAwsomeDialog(
  BuildContext context, {
  void Function()? btnOkOnPress,
  String? title,
  String? info,
}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    headerAnimationLoop: false,
    title: title ?? 'Error',
    desc: info ?? 'Are you sure you want to delete the item',
    btnOkOnPress: btnOkOnPress,
    btnOkColor: Colors.red,
  ).show();
}
