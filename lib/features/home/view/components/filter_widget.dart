import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/helpers/ui/modal_helper.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:motels/core/ui/styles/text_styles.dart';
import 'package:motels/features/home/store/home_store.dart';
import 'package:motels/features/home/view/components/filter_item.dart';
import 'package:motels/features/home/view/modals/filter_bottom_sheet.dart';

class FilterWidget extends StatelessWidget {
  final HomeStore store;

  const FilterWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: 48.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 16.width),
                Stack(
                  children: [
                    Badge(
                      alignment: Alignment.topLeft,
                      offset: const Offset(2, -3),
                      isLabelVisible: store.selectedFilter.isNotEmpty,
                      label: Text(
                        store.selectedFilter.length.toString(),
                        style: context.textStyles.caption.copyWith(color: context.colors.neutralWhite),
                      ),
                      child: FilterItem(
                        label: 'filtros',
                        showIcon: true,
                        isSelected: false,
                        onPressed: () => _showFilterSelectionModal(context),
                        isDisabled: !store.screenLoaded.value,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 8.width),
                SizedBox(
                  height: 40.height,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: store.itemsFilter.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 8.width);
                    },
                    itemBuilder: (context, index) {
                      final filter = store.itemsFilter[index];
                      return FilterItem(
                        label: filter,
                        isSelected: store.selectedFilter.contains(filter),
                        isDisabled: !store.screenLoaded.value,
                        onPressed: () => _setSelectedFilter(filter),
                      );
                    },
                  ),
                ),
                SizedBox(width: 16.width),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _setSelectedFilter(String filter) {
    store.toggleFilter(filter);
  }

  void _showFilterSelectionModal(BuildContext context) {
    ModalHelper.showCustomModal(
      context: context,
      child: FilterBottomSheet(store: store),
    );
  }
}
