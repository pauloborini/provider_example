import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:motels/core/ui/styles/text_styles.dart';
import 'package:motels/core/widgets/custom_icon_button.dart';
import 'package:motels/core/widgets/custom_text_button.dart';
import 'package:motels/features/home/store/home_store.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FilterBottomSheet extends StatelessWidget {
  final HomeStore store;

  const FilterBottomSheet({super.key, required this.store});

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
          'filtros',
          style: context.textStyles.titleMedium.copyWith(
            color: context.colors.textColorLight,
          ),
        ),
        centerTitle: true,
        actions: [
          CustomTextButton(
            label: 'limpar',
            labelSize: 16.font,
            onPressed: () => store.clearFilters(),
          ),
          SizedBox(width: 12.width),
        ],
      ),
      body: const Column(),
    );
  }
}
