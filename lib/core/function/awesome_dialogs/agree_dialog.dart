import 'package:ecommerce/index.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void agreeAwsomeDialog(
  BuildContext context, {
  String? title,
  String? info,
}) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.info,
    body: Center(
      child: TextWidget(
        info ??
            'The operation was successfully completed.\n Confirm or cancel the deletion process',
        fontSize: 14,
      ),
    ),
    title: title ?? 'Agree',
    desc: 'Confirm Agree',
  ).show();
}
