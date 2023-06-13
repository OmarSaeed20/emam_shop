import 'package:ecommerce/index.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void customAwsomeDialog(
  BuildContext context, {
  required void Function()? onTap,
  String? title,
  String? info,
  String? btnText,
  IconData? icon,
}) {
  AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    customHeader: Icon(icon ?? Icons.face, size: 50.weight),
    title: title ?? 'This is Custom Dialod',
    desc: info ?? 'Confirm or cancel the deletion process',
    btnOk: GestureDetector(
      onTap: onTap ??
          () {
            Navigator.of(context).pop();
          },
      child: TextWidget(btnText ?? "Cancel Button"),
    ),
  ).show();
}
