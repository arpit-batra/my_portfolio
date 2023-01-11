import 'package:flutter/material.dart';
import 'package:my_portfolio/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Map<int, Color> themeColor = {
      50: Color.fromRGBO(30, 0, 117, .1),
      100: Color.fromRGBO(30, 0, 117, .2),
      200: Color.fromRGBO(30, 0, 117, .3),
      300: Color.fromRGBO(30, 0, 117, .4),
      400: Color.fromRGBO(30, 0, 117, .5),
      500: Color.fromRGBO(30, 0, 117, .6),
      600: Color.fromRGBO(30, 0, 117, .7),
      700: Color.fromRGBO(30, 0, 117, .8),
      800: Color.fromRGBO(30, 0, 117, .9),
      900: Color.fromRGBO(30, 0, 117, 1),
    };
    return MaterialApp(
      title: 'Arpit Batra',
      theme: ThemeData(
          primarySwatch: const MaterialColor(0xFF1E0075, themeColor),
          accentColor: Color.fromRGBO(129, 88, 248, 1),
          colorScheme:
              ColorScheme.light(secondary: Color.fromRGBO(129, 88, 248, 1))),
      home: MainPage(),
    );
  }
}
