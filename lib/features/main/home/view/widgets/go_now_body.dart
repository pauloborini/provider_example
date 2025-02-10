import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';

class GoNowBody extends StatelessWidget {
  final HomeViewModel homeViewModel;

  const GoNowBody({super.key, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: context.colors.neutralShade100,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.adaptive),
          topRight: Radius.circular(16.adaptive),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 12.height),
          FilterWidget(homeViewModel: homeViewModel),
          LineDividerWidget(
            firstPadding: 12.height,
            secondPadding: 0,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 16.height, right: 32.width, left: 32.width, bottom: 80.height),
              shrinkWrap: true,
              itemCount: 5,
              separatorBuilder: (context, index) {
                return SizedBox(height: 32.height);
              },
              itemBuilder: (context, index) {
                return MotelCarrouselItem(
                  onFavoritePressed: () {
                    homeViewModel.toggleFilter('Favoritos');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
