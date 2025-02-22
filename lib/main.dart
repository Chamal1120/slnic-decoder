import 'package:flutter/material.dart';
import 'package:flutter_nic_decoder/controllers/nav_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_nic_decoder/theme/theme.dart';
import 'package:flutter_nic_decoder/screens/home.dart';
import 'package:flutter_nic_decoder/screens/about.dart';

void main() {
  runApp(const NICApp());
}

// Main App (root widget)
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

// Navigation Bar
class NavBarM3 extends StatelessWidget {
  NavBarM3({super.key});

  final List<Widget> pages = [HomePage(), AboutPage()];
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
