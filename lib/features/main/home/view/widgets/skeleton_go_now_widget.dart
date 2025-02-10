import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';

class SkeletonGoNowWidget extends StatelessWidget {
  final HomeViewModel homeViewModel;

  const SkeletonGoNowWidget({super.key, required this.homeViewModel});

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
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          SizedBox(height: 12.height),
          FilterWidget(homeViewModel: homeViewModel),
          LineDividerWidget(
            firstPadding: 12.height,
            secondPadding: 0,
          ),
          const SkeletonMotelItem(),
          const SkeletonMotelItem(),
        ],
      ),
    );
  }
}
