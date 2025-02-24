import 'package:flutter/material.dart';

/// A class representing the Catppuccin Mocha color palette.
/// This class contains a collection of colors used for styling UI elements
/// in the Catppuccin Mocha theme. Each color is represented as a `Color` value.
///
/// The colors are carefully selected to create a visually cohesive dark theme
/// with a focus on subtle contrasts and pastel-like tones.
class Catppuccin {
  final Color red;
  final Color primary;
  final Color green;
  final Color text;
  final Color subtext1;
  final Color subtext0;
  final Color overlay2;
  final Color overlay1;
  final Color overlay0;
  final Color surface2;
  final Color surface1;
  final Color surface0;
  final Color base;
  final Color mantle;
  final Color crust;

  const Catppuccin({
    required this.red,
    required this.primary,
    required this.green,
    required this.text,
    required this.subtext1,
    required this.subtext0,
    required this.overlay2,
    required this.overlay1,
    required this.overlay0,
    required this.surface2,
    required this.surface1,
    required this.surface0,
    required this.base,
    required this.mantle,
    required this.crust,
  });

  // Catppuccin Theme Colors
  /// The default Catppuccin theme color palette.
  ///
  /// This static instance provides all the colors in the Catppuccin Mocha
  /// theme for consistent usage throughout the app.
  static const Catppuccin mocha = Catppuccin(
    red: Color(0xFFF38BA8),
    primary: Color(0xFFF9E2AF),
    green: Color(0xFFA6E3A1),
    text: Color(0xFFCDD6F4),
    subtext1: Color(0xFFBAC2DE),
    subtext0: Color(0xFFA6ADC8),
    overlay2: Color(0xFF9399B2),
    overlay1: Color(0xFF7F849C),
    overlay0: Color(0xFF6C7086),
    surface2: Color(0xFF585B70),
    surface1: Color(0xFF45475A),
    surface0: Color(0xFF313244),
    base: Color(0xFF1E1E2E),
    mantle: Color(0xFF181825),
    crust: Color(0xFF11111B),
  )
  ;

  /// This static instance provides all the colors in the Catppuccin Latte
  /// theme for consistent usage throughout the app.
  static const Catppuccin latte = Catppuccin(
    red: Color(0xFFF38BA8),
    primary: Color(0xFF1E1E2E),
    green: Color(0xFF40A02B),
    text: Color(0xFF4C4F69),
    subtext1: Color(0xFF5C5F77),
    subtext0: Color(0xFF6C6F85),
    overlay2: Color(0xFF7C7F93),
    overlay1: Color(0xFF8C8FA1),
    overlay0: Color(0xFF9CA0B0),
    surface2: Color(0xFFACB0BE),
    surface1: Color(0xFFBCC0CC),
    surface0: Color(0xFFDCE0E8),
    base: Color(0xFFF9E2AF),
    mantle: Color(0xFFF9E2AF),
    crust: Color(0xFFE5C890),
  );
}
