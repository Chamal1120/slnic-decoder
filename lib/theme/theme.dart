import 'package:flutter/material.dart';
import 'package:flutter_nic_decoder/theme/palette.dart';

// Shortening the CatppuccinMocha class to mocha
final mocha = CatppuccinMocha.flavor;

// Defining the dark theme for the app
final ThemeData darkCatppuccinTheme = ThemeData(
  useMaterial3: true,

  appBarTheme: AppBarTheme(
    backgroundColor: mocha.base,
  ),

  textTheme: TextTheme(
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
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all(
        TextStyle(
          color: mocha.text,
          fontSize: 12.0,
        ),
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return mocha.yellow;
          }
          return mocha.yellow;
        },
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: mocha.surface2,
    hintStyle: TextStyle(
      color: mocha.subtext0,
      fontSize: 12.0,
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
