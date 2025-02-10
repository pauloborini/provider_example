import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PeriodItem extends StatelessWidget {
  const PeriodItem({super.key});

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
                  '1 hora',
                  style: context.textStyles.bodyTextMedium.copyWith(
                    fontSize: 19.font,
                    color: context.colors.textColorMedium,
                  ),
                ),
                SizedBox(height: 4.height),
                const PriceDisplayWidget(value: 100, fontSize: 19),
              ],
            ),
          ),
          Column(
            children: [
              Icon(PhosphorIconsBold.caretRight, size: 28.icon, color: context.colors.textColorLight),
            ],
          ),
        ],
      ),
    );
  }
}
