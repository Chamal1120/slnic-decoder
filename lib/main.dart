import 'package:flutter/material.dart';
import 'package:slnic_decoder/controllers/nav_controller.dart';
import 'package:get/get.dart';
import 'package:slnic_decoder/theme/theme.dart';
import 'package:slnic_decoder/screens/home.dart';
import 'package:slnic_decoder/screens/about.dart';

void main() {
  runApp(const NICApp());
}

/// The root widget for the Flutter NIC Decoder app.
///
/// This widget initializes the app, sets the theme, and specifies the home screen.
class NICApp extends StatelessWidget {
  const NICApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter NIC Decoder',
      darkTheme: darkCatppuccinTheme,
      /* 
      Enable dark mode by default 
      (for now till the theme switcher is implemented :)) 
      */
      themeMode: ThemeMode.dark,
      home: NavBarM3(),
    );
  }
}

/// A navigation bar that provides navigation between different pages of the app.
///
/// This widget uses a `NavController` to manage the state of the currently selected page.
/// It listens to the `selectedPage` observable and updates the `NavigationBar` and the body accordingly.
class NavBarM3 extends StatelessWidget {
  NavBarM3({super.key});

  /// A list of pages (widgets) to display in the body based on the selected index.
  final List<Widget> pages = [HomePage(), AboutPage()];

  /// A controller to manage and update the selected page in the navigation bar.
  final NavController navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      Wrap with Obx widget to use navController to update the NavigationBar
      */
      bottomNavigationBar: Obx(
        // Update the NavigationBar based on the selected page
        () {
          return NavigationBar(
            onDestinationSelected: (int index) {
              navController.changePage(index);
            },
            destinations: const <Widget>[
              NavigationDestination(
                  icon: Icon(Icons.manage_search), label: 'Decode'),
              NavigationDestination(
                  icon: Icon(Icons.info_outline), label: 'About'),
            ],
            selectedIndex: navController.selectedPage.value,
          );
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: catppuccinMochaGradient,
        ),

        // Update the body based on the selected page
        child: Obx(
          () {
            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: pages[navController.selectedPage.value],
            );
          },
        ),
      ),
    );
  }
}

