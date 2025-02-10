import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CityBottomSheet extends StatelessWidget {
  const CityBottomSheet({super.key});

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
          'regiões disponíveis',
          style: context.textStyles.titleMedium.copyWith(
            color: context.colors.textColorLight,
          ),
        ),
      ),
      body: const Column(),
    );
  }
}
