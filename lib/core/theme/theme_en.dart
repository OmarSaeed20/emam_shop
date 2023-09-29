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

