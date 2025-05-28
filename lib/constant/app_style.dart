import 'package:flutter/rendering.dart';

class AppStyle {
  static fontBold({double? fontSize}) {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize ?? 16);
  }

  static TextStyle fontNormal({double? fontSize}) {
    return TextStyle(fontWeight: FontWeight.normal, fontSize: fontSize ?? 16);
  }
}
