import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  // ignore: prefer_constructors_over_static_methods
  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get fontPoppins => 'Poppins';

  TextStyle get titleSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: fontPoppins,
        fontSize: 19.font,
        color: ColorsApp.instance.textColor,
      );

  TextStyle get titleMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: fontPoppins,
        fontSize: 19.font,
        color: ColorsApp.instance.textColor,
      );

  TextStyle get secondaryText => TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontPoppins,
        fontSize: 15.font,
        color: ColorsApp.instance.textColorLight,
      );

  TextStyle get bodyText => TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontPoppins,
        fontSize: 15.font,
        color: ColorsApp.instance.textColor,
      );

  TextStyle get bodyTextMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: fontPoppins,
        fontSize: 15.font,
        color: ColorsApp.instance.textColor,
      );

  TextStyle get buttonText => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: fontPoppins,
        fontSize: 15.font,
        color: ColorsApp.instance.textColor,
      );

  TextStyle get caption => TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontPoppins,
        fontSize: 12.font,
        color: ColorsApp.instance.textColor,
      );
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
