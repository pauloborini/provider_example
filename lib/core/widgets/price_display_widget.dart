import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motels/app_exports.dart';

class PriceDisplayWidget extends StatelessWidget {
  final double value;
  final double fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final int? maxLines;

  const PriceDisplayWidget({
    super.key,
    required this.value,
    required this.fontSize,
    this.fontColor,
    this.fontWeight,
    this.maxLines,
  });

  String formatPrice(double value) {
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(value);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatPrice(value),
      style: context.textStyles.bodyTextMedium.copyWith(
        color: fontColor ?? context.colors.textColor,
        fontSize: fontSize.font,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
