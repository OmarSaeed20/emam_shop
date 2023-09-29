import '../../index.dart';

ThemeData themeAR = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  useMaterial3: true,
  fontFamily: 'Cairo',
  // primaryColor: AppColors.primary,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.trans,
  ),
);