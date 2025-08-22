import 'package:flutter/material.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:motels/core/ui/styles/text_styles.dart';
import 'package:motels/core/widgets/custom_icon_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DateBottomSheet extends StatelessWidget {
  const DateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          icon: PhosphorIconsBold.caretDown,
          iconColor: context.colors.textColorLight,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'programação',
          style: context.textStyles.titleMedium.copyWith(
            color: context.colors.textColorLight,
          ),
        ),
      ),
      body: const Column(),
    );
  }
}
