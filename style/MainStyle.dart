import 'package:flutter/material.dart';

class StyleTheme {
  static const Color primaryColor = Colors.teal;
  static const Color infoColor = Colors.blue;
  static const Color successColor = Colors.green;
  static const Color bgColor = Color(0xFF80CBC4);
  static const Color primaryTextColor = Colors.black26;
  static const Color focusColor = Colors.white;
  static const Color errorColor = Color(0xFFAD1457);
  static const Color errorTextColor = Color(0xFFAD1457);
  static ThemeData get light {
    return ThemeData.light().copyWith(
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: focusColor,
            selectionColor: focusColor.withOpacity(0.4),
            selectionHandleColor: focusColor),
        scaffoldBackgroundColor: bgColor,
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Montserrat',
            ),
        primaryColor: StyleTheme.primaryColor,
        elevatedButtonTheme: elevatedButtonThemeData(),
        cardTheme: CardTheme(
          color: bgColor,
        ),
        iconTheme: IconThemeData(color: primaryColor),
        inputDecorationTheme: inputDecorationTheme(),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: bgColor,
          selectedItemColor: primaryColor,
        ));
  }

  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
        contentPadding: EdgeInsets.all(10.0),
        hintStyle: TextStyle(color: primaryTextColor),
        labelStyle: TextStyle(color: primaryTextColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryTextColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          width: 2,
          color: errorColor,
        )),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          width: 2,
          color: errorColor,
        )));
  }

  static ElevatedButtonThemeData elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: primaryColor,
            onPrimary: primaryTextColor,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            textStyle: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
            )));
  }
}
