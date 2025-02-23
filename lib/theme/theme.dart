import 'package:flutter/material.dart';
import 'package:slnic_decoder/theme/palette.dart';

// Shortening the CatppuccinMocha class to mocha for easier usage
/// A shortened reference to the `CatppuccinMocha` class, using the `flavor` property to define the theme.
final mocha = CatppuccinMocha.flavor;

/// The dark theme for the app, based on the Catppuccin Mocha color palette.
/// This theme defines the color scheme, text styles, and widget customizations for a consistent dark mode experience.
final ThemeData darkCatppuccinTheme = ThemeData(
  useMaterial3: true,

  /// The color scheme for the dark theme.
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

  /// The app bar theme defines the background color for the AppBar.
  appBarTheme: AppBarTheme(
    backgroundColor: mocha.base,
  ),

  /// The text theme defines the various text styles used throughout the app.
  textTheme: TextTheme(
    displayMedium: TextStyle(
      color: mocha.yellow,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    ),
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

  /// The card theme defines the look and feel for card-based UI elements such as TableCard.
  cardTheme: CardTheme(
    color: mocha.crust,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),

  /// The divider color is used for table borders and other separations.
  dividerColor: mocha.base,

  /// The ElevatedButtonThemeData defines the style for all `ElevatedButton` widgets.
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
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),

  /// The text selection theme defines the appearance of text selection cursors.
  textSelectionTheme: TextSelectionThemeData(cursorColor: mocha.text),

  /// The input decoration theme defines the styling for text fields and form inputs.
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

  /// The SnackBar theme defines the background and text styling for SnackBars.
  snackBarTheme: SnackBarThemeData(
    backgroundColor: mocha.base,
    contentTextStyle: TextStyle(
      color: mocha.red,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
  ),

  /// The navigation bar theme defines the appearance of the app's bottom navigation bar.
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

/// A background gradient using the mocha color palette.
/// This gradient is used to create a smooth visual transition between two colors.
final LinearGradient catppuccinMochaGradient = LinearGradient(
  colors: [mocha.mantle, mocha.crust],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

