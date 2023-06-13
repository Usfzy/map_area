import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color green200 = fromHex('#aadec0');

  static Color lime300 = fromHex('#dbf17a');

  static Color gray400 = fromHex('#bfc1c2');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color blueGray400 = fromHex('#888888');

  static Color red900 = fromHex('#c71016');

  static Color gray800 = fromHex('#3b4044');

  static Color lime800 = fromHex('#a98b25');

  static Color gray900 = fromHex('#0d1318');

  static Color amber100 = fromHex('#f9e8ac');

  static Color green900 = fromHex('#155f09');

  static Color green50 = fromHex('#e9f5e7');

  static Color gray300 = fromHex('#dedfdf');

  static Color lime100 = fromHex('#f3fad2');

  static Color greenA700 = fromHex('#009d44');

  static Color black90001 = fromHex('#00070c');

  static Color black900 = fromHex('#000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
