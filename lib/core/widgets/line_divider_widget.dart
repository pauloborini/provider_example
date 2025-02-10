import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';

class LineDividerWidget extends StatelessWidget {
  final double firstPadding;
  final double secondPadding;
  final Color? colorDivider;
  final bool isVertical;
  final double? verticalHeight;

  const LineDividerWidget({
    super.key,
    this.firstPadding = 16,
    this.secondPadding = 16,
    this.colorDivider,
    this.isVertical = false,
    this.verticalHeight,
  });

  const LineDividerWidget.vertical({
    super.key,
    this.firstPadding = 16,
    this.secondPadding = 16,
    this.colorDivider,
    this.isVertical = true,
    this.verticalHeight,
  });

  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return Container(
        margin: EdgeInsets.only(
          left: firstPadding.height,
          right: secondPadding.height,
        ),
        width: 1.width,
        height: verticalHeight ?? 32.height,
        color: colorDivider ?? context.colors.neutralShade400,
      );
    } else {
      return Column(
        children: [
          SizedBox(height: firstPadding.height),
          Divider(
            height: 1.height,
            thickness: 1.height,
            color: colorDivider ?? context.colors.neutralShade200,
          ),
          SizedBox(height: secondPadding.height),
        ],
      );
    }
  }
}
