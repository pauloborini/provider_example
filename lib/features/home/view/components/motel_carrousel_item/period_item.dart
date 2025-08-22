import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:motels/core/ui/styles/text_styles.dart';
import 'package:motels/core/widgets/price_display_widget.dart';
import 'package:motels/features/home/view/components/motel_carrousel_item/discount_tag_widget.dart';
import 'package:motels/features/main/home/domain/entities/complementary_entity.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PeriodItem extends StatelessWidget {
  final PeriodEntity periodModel;

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
                Row(
                  children: [
                    Text(
                      periodModel.formattedTime,
                      style: context.textStyles.bodyTextMedium.copyWith(
                        fontSize: 19.font,
                        color: context.colors.textColorMedium,
                      ),
                    ),
                    SizedBox(width: 8.width),
                    if (periodModel.discount != null)
                      DiscountTagWidget(
                        price: periodModel.price,
                        discount: periodModel.discount?.value ?? 0,
                      ),
                  ],
                ),
                SizedBox(height: 4.height),
                PriceDisplayWidget(
                  price: periodModel.price,
                  totalPrice: periodModel.totalPrice,
                  fontSize: 19.font,
                  discount: periodModel.discount?.value ?? 0,
                ),
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
