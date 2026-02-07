import '/index.dart';

AppBar authAppBar({VoidCallback? onTap}) => AppBar(
      leading:  IconAndTextBack(onTap: onTap),
      leadingWidth: 120.weight,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
    );
