import 'package:flutter/material.dart';
import 'package:flutter_nic_decoder/theme/palette.dart';

// Shortening the CatppuccinMocha class to mocha
final mocha = CatppuccinMocha.flavor;

// Defining the dark theme for the app
final ThemeData darkCatppuccinTheme = ThemeData(
  useMaterial3: true,

  colorScheme: ColorScheme(
    primary: mocha.yellow,
    secondary: mocha.text,
    surface: mocha.surface1,
    error: mocha.red,
    onPrimary: mocha.text,
    onSecondary: mocha.text,
    onSurface: mocha.text,
    onError: mocha.text,
    brightness: Brightness.dark,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: mocha.base,
  ),

  textTheme: TextTheme(
    titleMedium: TextStyle(
      color: mocha.crust,
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: mocha.text,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      color: mocha.yellow,
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: mocha.yellow,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: mocha.text,
      fontSize: 12.0,
    ),
  ),

  // Define a Card Theme for TableCard
  cardTheme: CardTheme(
    color: mocha.yellow,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),

  // Define table border theme
  dividerColor: mocha.crust,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: mocha.crust,
      backgroundColor: mocha.yellow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 12.0,
      ),
      textStyle: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),

  textSelectionTheme: TextSelectionThemeData(cursorColor: mocha.text),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: mocha.surface0,
    hintStyle: TextStyle(
      color: mocha.subtext0,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    contentPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    suffixIconColor: mocha.subtext0,
  ),

  snackBarTheme: SnackBarThemeData(
    backgroundColor: mocha.base,
    contentTextStyle: TextStyle(
      color: mocha.red,
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
    ),
  ),

  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: mocha.base,
    indicatorColor: mocha.yellow,
    labelTextStyle: WidgetStateProperty.resolveWith(
      (Set<WidgetState> states) {
        return TextStyle(
          color: mocha.yellow,
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
        );
      },
    ),
    iconTheme: WidgetStateProperty.resolveWith(
      (Set<WidgetState> states) {
        return IconThemeData(
          color: states.contains(WidgetState.selected)
              ? mocha.crust
              : mocha.yellow,
        );
      },
    ),
  ),
);

// Background gradient
final LinearGradient catppuccinMochaGradient = LinearGradient(
  colors: [mocha.mantle, mocha.crust],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
