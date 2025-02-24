import 'package:flutter/material.dart';
import 'package:slnic_decoder/theme/palette.dart';

// Shortens the latte property of Catppuccin class to theme for easier usage
///
/// A shortened reference for the `Catppuccin` class, using the `latte` property to define the theme.
final theme = Catppuccin.latte;

/// The light theme for the app, based on the Catppuccin theme color palette.
/// This theme defines the color scheme, text styles, and widget customizations for a consistent light mode experience.
final ThemeData lightCatppuccinTheme = ThemeData(
  useMaterial3: true,

  /// The color scheme for the light theme.
  colorScheme: ColorScheme(
    primary: theme.primary,
    secondary: theme.text,
    surface: theme.surface1,
    error: theme.red,
    onPrimary: theme.text,
    onSecondary: theme.text,
    tertiary: theme.mantle,
    onTertiary: theme.crust,
    onSurface: theme.text,
    onError: theme.text,
    brightness: Brightness.light,
  ),

  /// The app bar theme defines the background color for the AppBar.
  appBarTheme: AppBarTheme(
    backgroundColor: theme.base,
  ),

  /// The text theme defines the various text styles used throughout the app.
  textTheme: TextTheme(
    displayMedium: TextStyle(
      color: theme.primary,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: theme.crust,
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: theme.text,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      color: theme.primary,
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: theme.primary,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: theme.text,
      fontSize: 12.0,
    ),
  ),

  /// The card theme defines the look and feel for card-based UI elements such as TableCard.
  cardTheme: CardTheme(
    color: theme.crust,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),

  /// The divider color is used for table borders and other separations.
  dividerColor: theme.base,

  /// The ElevatedButtonThemeData defines the style for all `ElevatedButton` widgets.
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: theme.crust,
      backgroundColor: theme.primary,
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
  textSelectionTheme: TextSelectionThemeData(cursorColor: theme.text),

  /// The input decoration theme defines the styling for text fields and form inputs.
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: theme.surface0,
    hintStyle: TextStyle(
      color: theme.subtext0,
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
    suffixIconColor: theme.subtext0,
  ),

  /// The SnackBar theme defines the background and text styling for SnackBars.
  snackBarTheme: SnackBarThemeData(
    backgroundColor: theme.base,
    contentTextStyle: TextStyle(
      color: theme.red,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
  ),

  /// The navigation bar theme defines the appearance of the app's bottom navigation bar.
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: theme.base,
    indicatorColor: theme.primary,
    labelTextStyle: WidgetStateProperty.resolveWith(
      (Set<WidgetState> states) {
        return TextStyle(
          color: theme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
        );
      },
    ),
    iconTheme: WidgetStateProperty.resolveWith(
      (Set<WidgetState> states) {
        return IconThemeData(
          color: states.contains(WidgetState.selected)
              ? theme.crust
              : theme.primary,
        );
      },
    ),
  ),
);
