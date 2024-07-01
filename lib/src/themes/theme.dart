import 'package:alarmy/src/themes/custom/appbar_theme.dart';
import 'package:alarmy/src/themes/custom/elevatedbutton_theme.dart';
import 'package:alarmy/src/themes/custom/slider_theme.dart';
import 'package:alarmy/src/themes/custom/text_theme.dart';
import 'package:alarmy/src/themes/custom/textformfield_theme.dart';
import 'package:flutter/material.dart';

class KAppTheme {
  KAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: KTextTheme.lightTextTheme,
    elevatedButtonTheme: KElevatedButtonTheme.light,
    inputDecorationTheme: KTextFormTheme.light,
    appBarTheme: KAppBarTheme.light,
    sliderTheme: KSliderTheme.light,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    iconTheme: IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.black,
    textTheme: KTextTheme.darkTextTheme,
    elevatedButtonTheme: KElevatedButtonTheme.dark,
    inputDecorationTheme: KTextFormTheme.dark,
    appBarTheme: KAppBarTheme.dark,
    sliderTheme: KSliderTheme.dark,
  );
}
