import 'package:bottomsheetexample/main_page/main_page.dart';
import 'package:bottomsheetexample/theme/theme_dark.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DarkTheme().theme,
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}