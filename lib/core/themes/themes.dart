import 'package:flutter/material.dart';
import 'package:planner/core/utils/app_colors.dart';

class LightTheme {
  static final ThemeData purpleTheme = ThemeData(
    primaryColor: LightAppColors.primary,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: LightAppColors.background,
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: const TextStyle(color: LightAppColors.secondary),
      activeIndicatorBorder: const BorderSide(
        color: LightAppColors.secondary,
        width: 2.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          color: LightAppColors.primary,
          width: 2.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(color: LightAppColors.secondary, width: 2.0),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: LightAppColors.accent,
      selectionColor: LightAppColors.accent,
      selectionHandleColor: LightAppColors.accent,
    ),
    dividerTheme: const DividerThemeData(
      thickness: 2.0,
      color: LightAppColors.accent,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Sans Serif',
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Open Sans',
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: LightAppColors.primary,
      selectedItemColor: LightAppColors.iconColor,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
    ),
    colorScheme: const ColorScheme.light(
      primary: LightAppColors.primary,
      secondary: LightAppColors.secondary,
      tertiary: LightAppColors.accent,
      background: LightAppColors.background,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onBackground: Colors.black87,
    ),
  );
}

class DarkTheme {
  static final ThemeData orangeTheme = ThemeData(
    primaryColor: DarkAppColors.primary,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff121212),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: const TextStyle(color: DarkAppColors.secondary),
      activeIndicatorBorder: const BorderSide(
        color: DarkAppColors.secondary,
        width: 2.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
          color: DarkAppColors.primary,
          width: 2.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(color: DarkAppColors.accent, width: 2.0),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: DarkAppColors.accent,
      selectionColor: DarkAppColors.accent,
      selectionHandleColor: DarkAppColors.accent,
    ),
    dividerTheme: const DividerThemeData(
      thickness: 2.0,
      color: DarkAppColors.accent,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Sans Serif',
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Open Sans',
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: DarkAppColors.primary,
      secondary: DarkAppColors.secondary,
      tertiary: DarkAppColors.accent,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.white60,
    ),
  );
}
