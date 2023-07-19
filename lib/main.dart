import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/firebase_options.dart';
import 'package:my_portfolio/main_page.dart';
import 'package:my_portfolio/providers/scroll_offset_provider.dart';
import 'package:my_portfolio/providers/section_heights_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

          // accentColor: ,
          colorScheme:
              ColorScheme.light(secondary: Color.fromRGBO(129, 88, 248, 1))),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: ScrollOffsetProvider()),
          ChangeNotifierProvider.value(value: SectionHeightsProvider()),
        ],
        child: MainPage(),
      ),
    );
  }
}
