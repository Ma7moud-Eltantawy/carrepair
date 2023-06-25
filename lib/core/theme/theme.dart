import 'package:flutter/material.dart';
import 'package:mechanic/core/manager/colors_manager.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorsManager.primary))),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: ColorsManager.primary,
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorsManager.primary,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: ColorsManager.primary,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  );
}
