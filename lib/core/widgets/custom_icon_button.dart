import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double? iconSize;
  final Color? iconColor;
  final VoidCallback onPressed;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.iconSize,
    this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 1,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: onPressed,
      style: const ButtonStyle(
        splashFactory: NoSplash.splashFactory,
      ),
      icon: Icon(
        icon,
      ),
      iconSize: iconSize ?? 26.icon,
      color: iconColor ?? context.colors.primary,
    );
  }
}
