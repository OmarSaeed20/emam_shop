import '../../../../index.dart';

SizedBox productTitle(String title, {double? wid, int? maxLi}) => SizedBox(
      width: wid,
      child: TextWidget(
        title,
        fontSize: 14.weight,
        maxLines: maxLi ?? 1,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.start,
        overFlow: TextOverflow.ellipsis,
      ),
    );
