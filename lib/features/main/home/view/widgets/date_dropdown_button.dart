import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:motels/app_exports.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DateDropdownButton extends StatelessWidget {
  final HomeViewModel viewModel;

  const DateDropdownButton({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDateSelectionModal(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          IntrinsicWidth(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${viewModel.selectedInitialDate} - ${viewModel.selectedFinalDate}',
                  style: context.textStyles.bodyTextMedium.copyWith(color: context.colors.neutralWhite),
                ),
                SizedBox(width: 6.width),
                Icon(
                  PhosphorIconsBold.caretDown,
                  color: context.colors.neutralWhite,
                  size: 16.icon,
                ),
              ],
            ),
          ),
          SizedBox(height: 2.height),
          Builder(
            builder: (context) {
              final textWidth = _calculateTextWidth(context, viewModel.selectedInitialDate) +
                  _calculateTextWidth(context, viewModel.selectedFinalDate) +
                  _calculateTextWidth(context, ' - ');
              final totalWidth = textWidth + 24.width;
              return SizedBox(
                width: totalWidth,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final dashCount = (constraints.maxWidth / 5).floor();
                    return Row(
                      children: List.generate(
                        dashCount,
                        (index) => Container(
                          width: 3.width,
                          height: 1.height,
                          color: context.colors.neutralWhite,
                          margin: EdgeInsets.symmetric(horizontal: 1.width),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  double _calculateTextWidth(BuildContext context, String text) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: context.textStyles.bodyTextMedium),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.width;
  }

  void _showDateSelectionModal(BuildContext context) {
    showMaterialModalBottomSheet(
      duration: const Duration(milliseconds: 200),
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) {
        return const DateBottomSheet();
      },
    );
  }
}
