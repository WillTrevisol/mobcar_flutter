import 'package:flutter/material.dart';

class AppTheme {
  static Color yellowMob = const Color.fromRGBO(250, 173, 20, 1.0);
  static Color blackMob = const Color.fromRGBO(0, 0, 0, 1.0);
  static Color greyMob = const Color.fromRGBO(38, 38, 38, 1.0);
  static Color greyAccentMob = const Color.fromRGBO(89, 89, 89, 1.0);
  static Color whiteMob = const Color.fromRGBO(250, 250, 250, 1.0);
  static Color blueMob = const Color.fromRGBO(0, 173, 238, 1.0);

  static ThemeData themeData = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: blackMob,
      iconTheme: IconThemeData(
        color: blueMob,
      ),
      titleTextStyle: TextStyle(
        color: blueMob,
        fontWeight: FontWeight.w100,
        fontSize: 12,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: blackMob,
      elevation: 0,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: blackMob,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: blackMob,
        fontSize: 16,
      ),
      bodyLarge: TextStyle(
        color: greyMob,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: blueMob,
        fontSize: 16,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}
