
import 'package:flutter/material.dart%20';

extension TextThemeWithContext on BuildContext{
  TextTheme getTextThemeWithContext(BuildContext context) => Theme.of(context).textTheme;
}