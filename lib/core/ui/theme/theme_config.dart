import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motels/app_exports.dart';

class ThemeConfig {
  ThemeConfig._();

  static final theme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    useMaterial3: true,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    fontFamily: 'Raleway',
    primaryColor: ColorsApp.instance.primary,
    scaffoldBackgroundColor: ColorsApp.instance.backgroundColor,
    dividerColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.primary,
      primary: ColorsApp.instance.primary,
      secondary: ColorsApp.instance.primary,
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsApp.instance.backgroundColor,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: Platform.isAndroid
          ? SystemUiOverlayStyle(
              statusBarColor: ColorsApp.instance.primary,
              statusBarIconBrightness: Brightness.light,
            )
          : SystemUiOverlayStyle.light,
    ),
  );
}
