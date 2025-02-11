import 'package:flutter/material.dart';
import 'package:flutter_nic_decoder/controllers/nav_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_nic_decoder/screens/home.dart';
import 'package:flutter_nic_decoder/screens/about.dart';
import 'package:flutter_nic_decoder/theme/palette.dart';

final mocha = CatppuccinMocha.flavor;

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
          backgroundColor: mocha.base,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: mocha.yellow,
            fontSize: 45.0,
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
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: mocha.base,
          indicatorColor: mocha.yellow,
          labelTextStyle: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(
                  color: mocha.yellow,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                );
              } else {
                return TextStyle(
                  color: mocha.yellow,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                );
              }
            },
          ),
          iconTheme: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(color: mocha.crust);
              } else {
                return IconThemeData(color: mocha.yellow);
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [mocha.mantle, mocha.crust],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
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
