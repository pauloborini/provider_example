import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SeeMoreWidget extends StatelessWidget {
  const SeeMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'ver',
              style: context.textStyles.bodyText.copyWith(color: context.colors.textColorLight),
            ),
            Text(
              'todos',
              style: context.textStyles.bodyText.copyWith(color: context.colors.textColorLight),
            ),
          ],
        ),
        SizedBox(width: 8.width),
        Icon(
          PhosphorIconsBold.caretDown,
          size: 14.icon,
          color: context.colors.textColorLight,
        ),
      ],
    );
  }
}
