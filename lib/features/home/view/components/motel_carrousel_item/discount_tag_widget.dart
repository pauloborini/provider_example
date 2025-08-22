import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:motels/core/ui/styles/text_styles.dart';

class DiscountTagWidget extends StatefulWidget {
  final double price;
  final double discount;

  const DiscountTagWidget({super.key, required this.price, required this.discount});

  @override
  State<DiscountTagWidget> createState() => _DiscountTagWidgetState();
}

class _DiscountTagWidgetState extends State<DiscountTagWidget> {
  late double discountPercentage;

  @override
  void initState() {
    super.initState();
    _calculateDiscount();
  }

  void _calculateDiscount() {
    discountPercentage = (widget.discount / widget.price) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.adaptive, vertical: 2.adaptive),
      decoration: BoxDecoration(
        color: context.colors.neutralWhite,
        border: Border.all(color: context.colors.supportGreen),
        borderRadius: BorderRadius.circular(100.adaptive),
      ),
      child: Text(
        '${discountPercentage.floor()}% off',
        style: context.textStyles.caption.copyWith(
          color: context.colors.supportGreen,
        ),
      ),
    );
  }
}
