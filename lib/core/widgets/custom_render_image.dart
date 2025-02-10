import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';

class CustomRenderImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double width;
  final double? height;

  const CustomRenderImage({
    super.key,
    required this.imageUrl,
    required this.fit,
    required this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FadeInImage.assetNetwork(
        placeholder: Assets.placeholder,
        image: imageUrl,
        fit: fit,
        width: width,
        height: height,
        imageErrorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            color: context.colors.neutralWhite.withOpacity(0.2),
            alignment: Alignment.center,
            child: Icon(
              Icons.image_not_supported,
              color: context.colors.neutralWhite,
              size: 24.icon,
            ),
          );
        },
        placeholderErrorBuilder: (context, error, stackTrace) {
          return SkeletonWidget(width: width, height: height);
        },
      ),
    );
  }
}
