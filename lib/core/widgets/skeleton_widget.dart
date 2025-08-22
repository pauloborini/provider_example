import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonWidget extends StatelessWidget {
  final double width;
  final double? height;

  const SkeletonWidget({
    super.key,
    required this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colors.neutralShade200,
      highlightColor: context.colors.neutralShade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.colors.neutralShade200,
          borderRadius: BorderRadius.circular(16.adaptive),
        ),
      ),
    );
  }
}
