import 'package:flutter/material.dart';

/// A class representing the Catppuccin Mocha color palette.
/// This class contains a collection of colors used for styling UI elements
/// in the Catppuccin Mocha theme. Each color is represented as a `Color` value.
///
/// The colors are carefully selected to create a visually cohesive dark theme
/// with a focus on subtle contrasts and pastel-like tones.
class CatppuccinMocha {
  final Color rosewater;
  final Color flamingo;
  final Color pink;
  final Color mauve;
  final Color red;
  final Color maroon;
  final Color peach;
  final Color yellow;
  final Color green;
  final Color teal;
  final Color sky;
  final Color sapphire;
  final Color blue;
  final Color lavender;
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

  const CatppuccinMocha({
    required this.rosewater,
    required this.flamingo,
    required this.pink,
    required this.mauve,
    required this.red,
    required this.maroon,
    required this.peach,
    required this.yellow,
    required this.green,
    required this.teal,
    required this.sky,
    required this.sapphire,
    required this.blue,
    required this.lavender,
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

  // Catppuccin Mocha Theme Colors
  /// The default Catppuccin Mocha theme color palette.
  ///
  /// This static instance provides all the colors in the Catppuccin Mocha
  /// theme for consistent usage throughout the app.
  static const CatppuccinMocha flavor = CatppuccinMocha(
    rosewater: Color(0xFFF5E0DC),
    flamingo: Color(0xFFF2CDCD),
    pink: Color(0xFFF5C2E7),
    mauve: Color(0xFFCBA6F7),
    red: Color(0xFFF38BA8),
    maroon: Color(0xFFEBA0AC),
    peach: Color(0xFFFAB387),
    yellow: Color(0xFFF9E2AF),
    green: Color(0xFFA6E3A1),
    teal: Color(0xFF94E2D5),
    sky: Color(0xFF89DCEB),
    sapphire: Color(0xFF74C7EC),
    blue: Color(0xFF89B4FA),
    lavender: Color(0xFFB4BEFE),
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
  );
}
