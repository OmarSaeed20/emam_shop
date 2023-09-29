import '/index.dart';

class TitleRow extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final double? foSiz;
  final bool seeAll;
  final String? all;

  const TitleRow(
    this.title, {
    super.key,
    this.onTap,
    this.seeAll = true,
    this.foSiz,
    this.all,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextWidget(
            title,
            fontSize: foSiz ?? 17.weight,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (seeAll)
          TextButton(
            onPressed: onTap ?? () {},
            child: Row(
              children: [
                TextWidget(all ?? "See all", fontSize: 14.weight),
                3.sW,
                Icon(
                  MyLocaleControllerImp.to.themeData == themeEN
                      ? Icons.keyboard_double_arrow_right_rounded
                      : Icons.keyboard_double_arrow_left_rounded,
                  // CupertinoIcons.chevron_right_2,
                  size: 16.weight,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
