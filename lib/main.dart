import 'package:flutter/material.dart';
import 'package:flutter_nic_decoder/controllers/nav_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_nic_decoder/theme/theme.dart';
import 'package:flutter_nic_decoder/screens/home.dart';
import 'package:flutter_nic_decoder/screens/about.dart';
import 'package:flutter_nic_decoder/screens/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter NIC Decoder',
      darkTheme: darkCatppuccinTheme,
      themeMode: ThemeMode.dark,
      home: NavBarM3(),
    );
  }
}

// Navigation Bar with Material 3
class NavBarM3 extends StatelessWidget {
  NavBarM3({super.key});

  final List<Widget> pages = [HomePage(), AboutPage(), ResultPage()];

  final NavController navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
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
