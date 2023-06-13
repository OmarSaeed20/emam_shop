import 'package:ecommerce/index.dart';

class CheckboxListTileWidget extends StatelessWidget {
  const CheckboxListTileWidget({
    required this.title,
    required this.onChanged,
    super.key,
    this.subtitle,
    this.contentPadding,
    this.leadingIc,
    this.trailing,
    this.leadcolor,
    this.isSubtitle = true,
    required this.value,
    this.secondary,
  });
  final String title;
  final void Function(bool?) onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final String? subtitle;
  final IconData? leadingIc;
  final String? secondary;
  final Color? leadcolor;
  final Widget? trailing;
  final bool isSubtitle;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingOnly(left: 5),
      child: CheckboxListTile(
        dense: true,
        contentPadding: contentPadding ?? paddingOnly(left: 10, right: 20),
        onChanged: onChanged,
        value: value,
        secondary: secondary != null
            ? Container(
                height: 35.height,
                width: 38.weight,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(secondary!)),
                ),
              )
            : Icon(
                leadingIc,
                color: leadcolor ?? AppColors.primary2,
                size: 25.weight,
              ),
        title: TextWidget(title, fontSize: 12.weight),
        subtitle: isSubtitle == true
            ? TextWidget(
                subtitle != null ? "$subtitle" : "",
                fontSize: 9.weight,
                fontWeight: FontWeight.w400,
              )
            : null,
      ),
    );
  }
}
