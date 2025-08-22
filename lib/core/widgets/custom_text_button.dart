import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:motels/core/ui/styles/text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final double? labelSize;
  final bool withPadding;
  final VoidCallback onPressed;

  const CustomTextButton({
    super.key,
    required this.label,
    this.labelSize,
    this.withPadding = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: withPadding ? 4.adaptive : 0,
          vertical: withPadding ? 2.adaptive : 0,
        ),
        child: Text(
          label,
          style: context.textStyles.bodyTextMedium.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: labelSize ?? 15.font,
            color: context.colors.primary,
          ),
        ),
      ),
    );
  }
}
