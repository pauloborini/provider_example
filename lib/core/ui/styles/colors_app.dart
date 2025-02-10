import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  // ignore: prefer_constructors_over_static_methods
  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0xFFd11621);

  Color get primaryDark => const Color(0xFFb6000c);

  Color get primaryLight => const Color(0xfff3545b);

  Color get textColor => neutralShade1000;

  Color get textColorMedium => neutralShade800;

  Color get textColorLight => neutralShade600;

  Color get supportGreen => const Color(0xFF1bb98e);

  Color get supportYellow => const Color(0xFFffb200);

  Color get neutralShade1000 => const Color(0xFF0B0C0D);

  Color get neutralShade900 => const Color(0xFF151719);

  Color get neutralShade800 => const Color(0xFF222426);

  Color get neutralShade700 => const Color(0xFF45484D);

  Color get neutralShade600 => const Color(0xFF737880);

  Color get neutralShade500 => const Color(0xFFA4AAB2);

  Color get neutralShade400 => const Color(0xFFC0C5CC);

  Color get neutralShade300 => const Color(0xFFDFE1E5);

  Color get neutralShade200 => const Color(0xFFEBEFF4);

  Color get neutralShade150 => const Color(0xFFF3F8FD);

  Color get neutralShade100 => const Color(0xFFf8f9fb);

  Color get neutralWhite => const Color(0xFFFFFFFF);

  Color get backgroundColor => neutralWhite;
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
