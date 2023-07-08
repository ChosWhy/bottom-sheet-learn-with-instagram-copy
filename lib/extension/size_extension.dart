import 'package:flutter/material.dart';

extension DeviceSizeExtension on BuildContext{
  double getWidthWithContext(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  double getHeightWithContext(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
}