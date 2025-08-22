import 'package:flutter/material.dart';
import 'package:motels/core/constants/constants.dart';

extension SizeExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get constrainedScreenWidth => screenWidth > AppConstants.kMaxWidth ? AppConstants.kMaxWidth : screenWidth;

  double percentWidth(double percent) => constrainedScreenWidth * percent;

  double percentHeight(double percent) => screenHeight * percent;
}
