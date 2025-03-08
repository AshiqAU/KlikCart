
import 'package:flutter/material.dart';

import '../../ui_lib/widgets/bottom_navbar.dart';
import '../view/home_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wac_test',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      routes: {
        ///screens
        BottomNavBar.routeName: (context) =>  BottomNavBar(),
        HomeScreen.routeName: (context) =>  HomeScreen(),
      },
    );
  }
}
