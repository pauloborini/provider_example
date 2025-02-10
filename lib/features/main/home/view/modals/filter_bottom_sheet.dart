import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FilterBottomSheet extends StatelessWidget {
  final HomeViewModel homeViewModel;

  const FilterBottomSheet({super.key, required this.homeViewModel});

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
            onPressed: () => homeViewModel.clearFilters(),
          ),
          SizedBox(width: 12.width),
        ],
      ),
      body: const Column(),
    );
  }
}
