import 'package:flutter_test/flutter_test.dart';
import 'package:slnic_decoder/controllers/nav_controller.dart'; // Adjust the import to your project structure

void main() {
  // Initialize GetX before running any tests
  TestWidgetsFlutterBinding.ensureInitialized();

  late NavController navController;

  setUp(() {
    // Initialize NavController before each test
    navController = NavController();
  });

  group('NavController Tests', () {
    test('Initial selectedPage should be 0', () {
      // Test initial state of the selectedPage
      expect(navController.selectedPage.value, 0);
    });

    test('Should change selectedPage when changePage is called', () {
      // Test if the selectedPage updates correctly when changePage is called
      navController.changePage(2);
      expect(navController.selectedPage.value, 2);

      navController.changePage(3);
      expect(navController.selectedPage.value, 3);
    });

    test('Should update selectedPage when different values are set', () {
      // Test selectedPage updates with different page indices
      navController.changePage(1);
      expect(navController.selectedPage.value, 1);

      navController.changePage(5);
      expect(navController.selectedPage.value, 5);
    });
  });
}
