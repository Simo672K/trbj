import 'package:flutter/material.dart';

class AppThemeColors {
  static Color primaryColor = Color.fromRGBO(75, 81, 168, 1);
  static Color primaryColorAccent = Color.fromRGBO(114, 117, 163, 1);
  static Color secondaryColor = Color.fromRGBO(168, 138, 76, 1);
  static Color secondaryColorAccent = Color.fromRGBO(168, 160, 76, 1);
}

final ThemeData appTheme = ThemeData(
  colorSchemeSeed: AppThemeColors.primaryColor,

  /**
   * Card theaming
   * */
  cardTheme: CardTheme(
    surfaceTintColor: Colors.transparent,
    margin: EdgeInsets.all(0),
  ),

  /**
   * Appbar theaming
   * */
  appBarTheme: AppBarTheme(
    backgroundColor: AppThemeColors.primaryColor,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
    centerTitle: true,
  ),

  /**
   * Navigation bar theaming
   * */
  navigationBarTheme: NavigationBarThemeData(
    surfaceTintColor: Colors.transparent,
    labelTextStyle: WidgetStateProperty.all<TextStyle>(TextStyle(fontSize: 12)),
    height: 80,
  ),
);
