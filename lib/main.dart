import 'package:flutter/material.dart';
import 'package:flutter_nic_decoder/controllers/nav_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_nic_decoder/screens/home.dart';
import 'package:flutter_nic_decoder/screens/about.dart';
import 'package:catppuccin_flutter/catppuccin_flutter.dart';

// Extract mocha flavor from catppuccin flutter package
Flavor flavor = catppuccin.mocha;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter NIC Decoder',

      // Custom theme data using catppuccin
      darkTheme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: flavor.base,
        ),
        scaffoldBackgroundColor: flavor.crust,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: flavor.text,
          ),
          bodyMedium: TextStyle(
            color: flavor.text,
          ),
          bodySmall: TextStyle(
            color: flavor.text,
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: flavor.crust,
          indicatorColor: flavor.yellow,
          labelTextStyle: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(color: flavor.yellow);
              } else {
                return TextStyle(color: flavor.yellow);
              }
            },
          ),
          iconTheme: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(color: flavor.crust);
              } else {
                return IconThemeData(color: flavor.yellow);
              }
            },
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: NavBarM3(),
    );
  }
}

class NavBarM3 extends StatelessWidget {
  NavBarM3({super.key});

  final List<Widget> pages = [HomePage(), AboutPage()];

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
      body: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: pages[navController.selectedPage.value],
          );
        },
      ),
    );
  }
}
