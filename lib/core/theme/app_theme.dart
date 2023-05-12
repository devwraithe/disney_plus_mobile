import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'Outfit',
    colorScheme: AppColorScheme.lightColorScheme,
    scaffoldBackgroundColor: AppColorScheme.lightColorScheme.background,
    buttonTheme: AppButtonTheme.buttonTheme,
    filledButtonTheme: AppButtonTheme.filledButtonTheme,
    textTheme: AppTextTheme.textTheme,
    dividerTheme: const DividerThemeData(
      thickness: 2,
      color: AppColors.grey,
    ),
  );
}

@immutable
class AppColorScheme {
  static const lightColorScheme = ColorScheme.light(
    primary: AppColors.white,
    secondary: AppColors.black,
    tertiary: AppColors.grey,
    background: AppColors.white,
  );
}

@immutable
class AppButtonTheme {
  static final buttonTheme = ButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    buttonColor: AppColors.black,
  );
  static final filledButtonTheme = FilledButtonThemeData(
    style: AppButtonTheme.filledButtonStyle,
  );
  static final filledButtonStyle = FilledButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    textStyle: AppTextTheme.textTheme.bodyMedium?.copyWith(
      letterSpacing: 1,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    backgroundColor: AppColors.black,
    minimumSize: const Size(double.infinity, 56),
  );
}

@immutable
class AppTextTheme {
  static const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 60,
      color: AppColors.black,
      fontWeight: FontWeight.w100,
      fontFamily: "Canela",
      height: 1.5,
    ),
    displayMedium: TextStyle(
      fontSize: 41.05,
      color: AppColors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 38,
      color: AppColors.black,
      fontWeight: FontWeight.w100,
      fontFamily: "Canela",
      // height: 1.5,
    ),
    headlineLarge: TextStyle(
      fontSize: 32.44,
      color: AppColors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.83,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      fontFamily: "BagnardSans",
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: AppColors.darkBrown,
      height: 1.4,
    ),
    titleLarge: TextStyle(
      fontSize: 22.78,
      color: AppColors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.8,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      color: AppColors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      color: AppColors.lightBrown,
      fontWeight: FontWeight.w500,
    ),
  );
}

class AppColors {
  static const Color white = Color(0XFFFFFFFF);
  static const Color black = Color(0XFF212121);
  static const Color grey = Color(0XFFB7B7B7);
  static const Color lightGrey = Color(0XFF474747);
  static const Color grey40 = Color(0XFFD8D8D8);
  static const Color grey50 = Color(0XFFE8E8E8);
  static const Color primary = Color(0XFF212332);
  static const Color lightBrown = Color(0XFFE4BC84);
  static const Color darkBrown = Color(0XFFAD6D2F);
  static const Color darkGrey = Color(0XFFAD6D2F);
}
