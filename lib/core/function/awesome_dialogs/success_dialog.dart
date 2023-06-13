import 'package:ecommerce/index.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void successAwsomeDialog(
  BuildContext context, {
  required VoidCallback btnOkOnPress,
  String? title,
  String? info,
}) {
  AwesomeDialog(
    context: context,
    headerAnimationLoop: false,
    dialogType: DialogType.success,
    animType: AnimType.topSlide,
    title: title ?? 'Success !',
    desc: info ?? 'The operation was successfully completed.',
    btnOkIcon: Icons.check_circle,
    btnOkColor: Colors.green.shade900,
    btnOkOnPress: btnOkOnPress,
  ).show();
}

void success2AwsomeDialog(
  BuildContext context, {
  String? title,
  String? info,
  IconData? btnOkIcon,
}) {
  AwesomeDialog(
    context: context,
    animType: AnimType.leftSlide,
    headerAnimationLoop: false,
    dialogType: DialogType.success,
    title: title ?? 'Succes',
    desc: info ??
        'The operation was successfully completed..................................',
    btnOkIcon: btnOkIcon ?? Icons.check_circle,
    onDismissCallback: (_) {
      debugPrint('Dialog Dissmiss from callback');
    },
  ).show();
}
