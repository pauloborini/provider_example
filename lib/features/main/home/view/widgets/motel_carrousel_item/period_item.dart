import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PeriodItem extends StatelessWidget {
  final PeriodModel periodModel;

  const PeriodItem({super.key, required this.periodModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20.adaptive),
      decoration: BoxDecoration(
        color: context.colors.neutralWhite,
        borderRadius: BorderRadius.circular(8.adaptive),
        boxShadow: [
          BoxShadow(
            color: context.colors.neutralShade200,
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  periodModel.formattedTime,
                  style: context.textStyles.bodyTextMedium.copyWith(
                    fontSize: 19.font,
                    color: context.colors.textColorMedium,
                  ),
                ),
                SizedBox(height: 4.height),

                ///TODO criar a parte do desconto
                PriceDisplayWidget(value: periodModel.price, fontSize: 19.font),
              ],
            ),
          ),
          Column(
            children: [
              Icon(
                PhosphorIconsBold.caretRight,
                size: 28.icon,
                color: context.colors.textColorLight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
