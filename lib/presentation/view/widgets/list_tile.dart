import 'package:ecommerce/index.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    required this.title,
    super.key,
    this.subtitle,
    this.contentPadding,
    this.onTap,
    this.color,
    this.leadingIc,
    this.trailing,
    this.leadcolor,
    this.isSubtitle = true,
  });
  final String title;
  final EdgeInsetsGeometry? contentPadding;
  final String? subtitle;
  final Color? color;
  final void Function()? onTap;
  final IconData? leadingIc;
  final Color? leadcolor;
  final Widget? trailing;
  final bool isSubtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: paddingOnly(left: 5),
      child: ListTile(
        dense: true,
        contentPadding: contentPadding ?? paddingOnly(left: 15, right: 20),
        onTap: onTap,
        leading: Icon(
          leadingIc,
          color: leadcolor ?? AppColors.greyDeep,
          size: 25.weight,
        ),
        title: Padding(
          padding: paddingSymme(horizontal: 6),
          child: TextWidget(title, fontSize: 12.weight),
        ),
        subtitle: isSubtitle == true
            ? Padding(
                padding: paddingSymme(horizontal: 6),
                child: TextWidget(
                  subtitle != null ? "$subtitle" : "",
                  fontSize: 9.weight,
                  fontWeight: FontWeight.w400,
                ),
              )
            : null,
        horizontalTitleGap: 0,
        trailing: trailing,
      ),
    );
  }
}
