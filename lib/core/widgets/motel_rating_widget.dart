import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:motels/core/ui/styles/text_styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MotelRatingWidget extends StatelessWidget {
  final double rating;

  const MotelRatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.adaptive),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.adaptive),
        border: Border.all(color: context.colors.supportYellow, width: 2.adaptive),
      ),
      child: Row(
        children: [
          Icon(
            PhosphorIconsFill.star,
            color: context.colors.supportYellow,
            size: 16.icon,
          ),
          SizedBox(width: 4.width),
          Text(rating.toString(), style: context.textStyles.bodyTextMedium),
        ],
      ),
    );
  }
}
