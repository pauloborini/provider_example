import 'package:flutter/material.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:motels/features/home/view/components/skeleton_motel_item.dart';

class SkeletonGoNowWidget extends StatelessWidget {
  const SkeletonGoNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      color: context.colors.neutralShade100,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: const [
          SkeletonMotelItem(),
          SkeletonMotelItem(),
        ],
      ),
    );
  }
}
