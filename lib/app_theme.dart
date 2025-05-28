

import 'package:flutter/material.dart';
import 'package:tanay_gupta_portfolio/values/values.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _lightFillColor = Colors.black;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: const IconThemeData(color: AppColors.white),
      canvasColor: colorScheme.background,
      appBarTheme: const AppBarTheme(
        color:  AppColors.primaryColor,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.black,
        selectionColor: AppColors.textSelectionColor,
        selectionHandleColor: AppColors.primaryColor,
      ),
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      
      // accentColor: colorScheme.primary,
      focusColor: AppColors.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    primaryContainer: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    secondaryContainer: AppColors.black,
    background: AppColors.primaryColor,
    surface: AppColors.primaryColor,
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const _bold = FontWeight.w700;
  static const _semiBold = FontWeight.w600;
  static const _medium = FontWeight.w500;
  static const _regular = FontWeight.w400;
  static const _light = FontWeight.w300;

static final TextTheme _textTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: StringConst.VISUELT_PRO,
    fontSize: Sizes.TEXT_SIZE_96,
    color: AppColors.black,
    fontWeight: _bold,
  ),
  displayMedium: TextStyle(
    fontFamily: StringConst.VISUELT_PRO,
    fontSize: Sizes.TEXT_SIZE_60,
    color: AppColors.black,
    fontWeight: _bold,
  ),
  displaySmall: GoogleFonts.roboto(
    fontSize: Sizes.TEXT_SIZE_48,
    color: AppColors.black,
    fontWeight: _bold,
  ),
  headlineLarge: TextStyle(
    fontFamily: StringConst.VISUELT_PRO,
    fontSize: Sizes.TEXT_SIZE_34,
    color: AppColors.black,
    fontWeight: _bold,
  ),
  headlineMedium: GoogleFonts.roboto(
    fontSize: Sizes.TEXT_SIZE_24,
    color: AppColors.black,
    fontWeight: _bold,
  ),
  headlineSmall: TextStyle(
    fontFamily: StringConst.VISUELT_PRO,
    fontSize: Sizes.TEXT_SIZE_20,
    color: AppColors.black,
    fontWeight: _bold,
  ),
  titleMedium: TextStyle(
    fontFamily: StringConst.VISUELT_PRO,
    fontSize: Sizes.TEXT_SIZE_16,
    color: AppColors.secondaryColor,
    fontWeight: _semiBold,
  ),
  titleSmall: GoogleFonts.roboto(
    fontSize: Sizes.TEXT_SIZE_14,
    color: AppColors.secondaryColor,
    fontWeight: _semiBold,
  ),
  bodyLarge: TextStyle(
    fontFamily: StringConst.VISUELT_PRO,
    fontSize: Sizes.TEXT_SIZE_16,
    color: AppColors.secondaryColor,
    fontWeight: _light,
  ),
  bodyMedium: GoogleFonts.roboto(
    fontSize: Sizes.TEXT_SIZE_14,
    color: AppColors.secondaryColor,
    fontWeight: _light,
  ),
  labelLarge: GoogleFonts.roboto(
    fontSize: Sizes.TEXT_SIZE_14,
    color: AppColors.secondaryColor,
    fontWeight: _medium,
  ),
  bodySmall: TextStyle(
    fontFamily: StringConst.VISUELT_PRO,
    fontSize: Sizes.TEXT_SIZE_12,
    color: AppColors.white,
    fontWeight: _regular,
  ),
);


}
