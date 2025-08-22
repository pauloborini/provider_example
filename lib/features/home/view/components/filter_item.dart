import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FilterItem extends StatelessWidget {
  final String label;
  final bool showIcon;
  final bool isSelected;
  final bool isDisabled;
  final VoidCallback onPressed;

  const FilterItem({
    super.key,
    required this.label,
    this.showIcon = false,
    required this.isSelected,
    required this.onPressed,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isDisabled) return;
        onPressed();
      },
      child: Container(
        alignment: Alignment.center,
        height: 40.height,
        padding: EdgeInsets.symmetric(horizontal: 16.width),
        decoration: BoxDecoration(
          color: isSelected ? context.colors.primary : context.colors.neutralWhite,
          borderRadius: BorderRadius.circular(8.adaptive),
          border: Border.all(color: isSelected ? context.colors.primary : context.colors.neutralShade400),
        ),
        child: Row(
          children: [
            if (showIcon)
              Padding(
                padding: EdgeInsets.only(right: 6.width),
                child: Icon(
                  PhosphorIconsRegular.slidersHorizontal,
                  color: isSelected
                      ? context.colors.neutralWhite
                      : isDisabled
                          ? context.colors.neutralShade400
                          : context.colors.textColor,
                  size: 20.icon,
                ),
              ),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? context.colors.neutralWhite
                    : isDisabled
                        ? context.colors.neutralShade400
                        : context.colors.textColor,
                fontSize: 14.font,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
