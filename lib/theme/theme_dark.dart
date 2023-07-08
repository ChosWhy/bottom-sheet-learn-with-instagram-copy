
import 'package:bottomsheetexample/theme/theme_dark_color.dart';
import 'package:flutter/material.dart%20';

class DarkTheme{
  final ThemeDarkColor _themeDarkColor = ThemeDarkColor();
  late ThemeData theme;
  DarkTheme(){
    theme = ThemeData(
      textTheme: ThemeData.dark().textTheme.copyWith(
        titleLarge: TextStyle(color: _themeDarkColor.white),
        titleSmall: TextStyle(color: _themeDarkColor.white),
        titleMedium: TextStyle(color: _themeDarkColor.white)
      ),

    );
  }
}