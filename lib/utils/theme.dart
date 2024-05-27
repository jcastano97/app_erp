import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      color: Colors.grey,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      color: Colors.grey,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.normal,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );
}
