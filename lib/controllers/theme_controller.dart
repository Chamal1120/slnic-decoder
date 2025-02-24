import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// The controller for managing the app's theme mode using GetX and GetStorage.
/// 
/// This controller persists the user's theme preference using `GetStorage`
/// and applies the selected theme dynamically with `Get.changeThemeMode()`.
class ThemeController extends GetxController {
  /// Persistent storage instance for saving and retrieving theme settings.
  final _box = GetStorage();

  /// Observable variable for storing the current theme mode.
  /// Defaults to `ThemeMode.system`.
  final _themeMode = ThemeMode.system.obs;

  /// Getter to retrieve the current theme mode.
  ThemeMode get themeMode => _themeMode.value;

  /// Called when the controller is initialized.
  /// Loads the saved theme mode from storage (if available).
  @override
  void onInit() {
    super.onInit();
    // Retrieve the saved theme mode from local storage.
    String? savedTheme = _box.read('themeMode');
    if (savedTheme != null) {
      _themeMode.value = _stringToThemeMode(savedTheme);
    }
  }

  /// Updates the theme mode and saves the selection to persistent storage.
  ///
  /// - [mode]: The new `ThemeMode` to apply.
  void setThemeMode(ThemeMode mode) {
    _themeMode.value = mode;
    _box.write('themeMode', mode.toString()); // Save the selection
    Get.changeThemeMode(mode); // Apply the new theme mode
  }

  /// Converts a string representation of `ThemeMode` back to its enum value.
  ///
  /// - [value]: The string representation of the theme mode.
  /// - Returns: The corresponding `ThemeMode` enum value.
  ThemeMode _stringToThemeMode(String value) {
    switch (value) {
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      case 'ThemeMode.light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}

