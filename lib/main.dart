import 'package:flutter/material.dart';
import 'detail.dart';
import 'page_one.dart';
// import 'page_two.dart';
// import 'page_three.dart';
// import 'detail.dart';
// import 'detail2.dart';
// import 'info_page.dart';
// import 'sound_page.dart';
// import 'settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Choco Eng',
        initialRoute: '/one',
        routes: {
          '/one': (context) => const PageOne(),
          // '/two': (context) => PageTwo(),
          // '/three': (context) => PageThree(),
          '/detail': (context) => const Detail(),
          // '/detail2': (context) => Detail2(),
          // '/info': (context) => Info(),
          // '/sound': (context) => SoundPage(),
          // '/settings': (context) => Settings(),
        });
  }
}
