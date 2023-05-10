import '/index.dart';

ThemeData themeEN = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  useMaterial3: true,
  // fontFamily: AppStrings.montserrat,
  fontFamily: 'Poppins',
  /*
  primaryColor: AppColors.primary,
   appBarTheme:
      const AppBarTheme(elevation: 0.0, backgroundColor: Colors.transparent) */
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.primary,
    secondary: AppColors.secondaryLight,
  ),
);
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
