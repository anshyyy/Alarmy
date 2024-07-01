import 'package:flutter/material.dart';

class KSliderTheme {
  KSliderTheme._();
  static SliderThemeData light = SliderThemeData(
    activeTrackColor: Colors.black,
    inactiveTrackColor: Colors.grey,
    thumbColor: Colors.black,
    overlayColor: Colors.black.withOpacity(0.3),
    trackHeight: 8,
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
    overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
  );
  static SliderThemeData dark = SliderThemeData(
    activeTrackColor: Colors.white,
    inactiveTrackColor: const Color.fromARGB(255, 118, 117, 117),
    thumbColor: Colors.white,
    overlayColor: Colors.white.withOpacity(0.3),
    trackHeight: 6,
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
    overlayShape: const RoundSliderOverlayShape(overlayRadius: 18),
  );
}
