import '../../../../index.dart';

SizedBox productTitle(String title, {double? wid}) => SizedBox(
      width: wid,
      child: TextWidget(
        title,
        fontSize: 16.weight,
        maxLines: 1,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.start,
        overFlow: TextOverflow.ellipsis,
      ),
    );
