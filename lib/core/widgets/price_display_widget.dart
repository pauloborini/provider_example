import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motels/app_exports.dart';

class PriceDisplayWidget extends StatelessWidget {
  final double totalPrice;
  final double price;
  final double fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double discount;

  const PriceDisplayWidget({
    super.key,
    required this.totalPrice,
    required this.price,
    required this.fontSize,
    this.fontColor,
    this.fontWeight,
    this.maxLines,
    required this.discount,
  });

  String formatPrice(double value) {
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (discount > 0)
          Padding(
            padding: EdgeInsets.only(right: 12.width),
            child: Text(
              formatPrice(price),
              style: context.textStyles.bodyTextMedium.copyWith(
                color: context.colors.neutralShade500,
                fontSize: fontSize.font,
                fontWeight: fontWeight ?? FontWeight.w500,
                decoration: TextDecoration.lineThrough,
              ),
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        Text(
          formatPrice(totalPrice),
          style: context.textStyles.bodyTextMedium.copyWith(
            color: fontColor ?? context.colors.textColor,
            fontSize: fontSize.font,
            fontWeight: fontWeight ?? FontWeight.w500,
          ),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
