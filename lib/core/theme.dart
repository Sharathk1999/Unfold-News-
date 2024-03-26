import 'package:flutter/material.dart';
import 'package:unfold_news/core/colors.dart';


var lightTheme = ThemeData(
    useMaterial3: true,
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: lightBGColor,
      filled: true,
      enabledBorder: InputBorder.none,
      prefixIconColor: lightTextColor,
      labelStyle: TextStyle(
        fontFamily: "Raleway",
        fontSize: 15,
        color: lightFontColor,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: TextStyle(
        fontFamily: "Raleway",
        fontSize: 15,
        color: lightFontColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      background: lightBGColor,
      onBackground: lightFontColor,
      primaryContainer: lightContainerColor,
      onPrimaryContainer: lightFontColor,
      secondaryContainer: lightTextColor,
      primary: lightPrimaryColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Raleway",
        fontSize: 24,
        color: lightFontColor,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Raleway",
        fontSize: 20,
        color: lightFontColor,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Raleway",
        fontSize: 15,
        color: lightFontColor,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Raleway",
        fontSize: 16,
        color: lightFontColor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Raleway",
        fontSize: 15,
        color: lightFontColor,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontFamily: "Raleway",
        fontSize: 13,
        color: lightFontColor,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontFamily: "Raleway",
        fontSize: 13,
        color: lightTextColor,
        fontWeight: FontWeight.w300,
      ),
    ));
var darkTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkContainerColor,
      foregroundColor: darkFontColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: darkFontColor,
      ),
      titleTextStyle: TextStyle(
        fontFamily: "Raleway",
        fontSize: 20,
        color: darkFontColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      background: darkBGColor,
      onBackground: darkFontColor,
      primaryContainer: darkContainerColor,
      onPrimaryContainer: darkFontColor,
      secondaryContainer: darkTextColor,
      primary: darkPrimaryColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: darkBGColor,
      filled: true,
      enabledBorder: InputBorder.none,
      prefixIconColor: darkTextColor,
      labelStyle: TextStyle(
        fontFamily: "Raleway",
        fontSize: 15,
        color: darkFontColor,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: TextStyle(
        fontFamily: "Raleway",
        fontSize: 15,
        color: darkFontColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Raleway",
        fontSize: 24,
        color: darkFontColor,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Raleway",
        fontSize: 20,
        color: darkFontColor,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Raleway",
        fontSize: 15,
        color: darkFontColor,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Raleway",
        fontSize: 15,
        color: darkFontColor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Raleway",
        fontSize: 15,
        color: darkFontColor,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontFamily: "Raleway",
        fontSize: 13,
        color: darkFontColor,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontFamily: "Raleway",
        fontSize: 13,
        color: darkTextColor,
        fontWeight: FontWeight.w300,
      ),
    ));