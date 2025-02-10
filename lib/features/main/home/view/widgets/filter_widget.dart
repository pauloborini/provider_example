import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';

class FilterWidget extends StatelessWidget {
  final HomeViewModel homeViewModel;

  const FilterWidget({super.key, required this.homeViewModel});

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
                      isLabelVisible: homeViewModel.selectedFilter.isNotEmpty,
                      label: Text(
                        homeViewModel.selectedFilter.length.toString(),
                        style: context.textStyles.caption.copyWith(color: context.colors.neutralWhite),
                      ),
                      child: FilterItem(
                        label: 'filtros',
                        showIcon: true,
                        isSelected: false,
                        onPressed: () => _showFilterSelectionModal(context),
                        isDisabled: !homeViewModel.screenLoaded.value,
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
                    itemCount: homeViewModel.itemsFilter.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 8.width);
                    },
                    itemBuilder: (context, index) {
                      final filter = homeViewModel.itemsFilter[index];
                      return FilterItem(
                        label: filter,
                        isSelected: homeViewModel.selectedFilter.contains(filter),
                        isDisabled: !homeViewModel.screenLoaded.value,
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
    homeViewModel.toggleFilter(filter);
  }

  void _showFilterSelectionModal(BuildContext context) {
    ModalHelper.showCustomModal(
      context: context,
      child: FilterBottomSheet(homeViewModel: homeViewModel),
    );
  }
}
