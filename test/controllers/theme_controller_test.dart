import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:slnic_decoder/controllers/theme_controller.dart';

// Generate a mock class for GetStorage
@GenerateMocks([GetStorage])
import 'theme_controller_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // Initialize Flutter services

  late MockGetStorage mockStorage;
  late ThemeController themeController;

  setUp(() {
    Get.testMode = true; // Prevents side effects in GetX
    mockStorage = MockGetStorage();

    // Stub the read method to return null (no saved theme, should default to system)
    when(mockStorage.read('themeMode')).thenReturn(null);

    // Initialize ThemeController with the mocked storage
    themeController = ThemeController();
  });

  test('Initial theme mode should be system when no saved theme', () {
    // The controller should default to system mode when no theme is saved
    expect(themeController.themeMode, ThemeMode.system);
  });

  test('Should update theme mode correctly', () {
    // Test theme change to dark mode
    themeController.setThemeMode(ThemeMode.dark);
    expect(themeController.themeMode, ThemeMode.dark);

    // Test theme change to light mode
    themeController.setThemeMode(ThemeMode.light);
    expect(themeController.themeMode, ThemeMode.light);
  });
}

