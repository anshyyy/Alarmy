<<<<<<< HEAD
import "package:flutter/material.dart";

class KElevatedButtonTheme {
  KElevatedButtonTheme._();
  static ElevatedButtonThemeData light = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        side: BorderSide(color: Colors.grey),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
  );
  static ElevatedButtonThemeData dark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        side: BorderSide(color: Colors.grey),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
  );
}
=======
import "package:flutter/material.dart";

class KElevatedButtonTheme {
  KElevatedButtonTheme._();
  static ElevatedButtonThemeData light = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        side: BorderSide(color: Colors.grey),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
  );
  static ElevatedButtonThemeData dark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        side: BorderSide(color: Colors.grey),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
  );
}
>>>>>>> main
