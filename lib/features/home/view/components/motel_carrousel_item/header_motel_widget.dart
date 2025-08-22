import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:motels/core/ui/styles/text_styles.dart';
import 'package:motels/core/widgets/custom_render_image.dart';
import 'package:motels/core/widgets/favorite_button.dart';
import 'package:motels/core/widgets/motel_rating_widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HeaderMotelWidget extends StatelessWidget {
  final String logoUrl;
  final String motelName;
  final String motelLocation;
  final double motelRating;
  final int motelRatingCount;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const HeaderMotelWidget({
    super.key,
    required this.logoUrl,
    required this.motelName,
    required this.motelLocation,
    required this.motelRating,
    required this.motelRatingCount,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.width),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: CustomRenderImage(
              imageUrl: logoUrl,
              fit: BoxFit.cover,
              width: 50.adaptive,
              height: 50.adaptive,
            ),
          ),
          SizedBox(width: 16.width),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  motelName.toLowerCase(),
                  style: context.textStyles.titleMedium.copyWith(fontSize: 23.font),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  motelLocation.toLowerCase(),
                  style: context.textStyles.bodyText.copyWith(color: context.colors.textColorMedium),
                  maxLines: 1,
                ),
                SizedBox(height: 8.height),
                Row(
                  children: [
                    MotelRatingWidget(
                      rating: motelRating,
                    ),
                    SizedBox(width: 12.width),
                    Flexible(
                      child: Text(
                        '$motelRatingCount  ${motelRatingCount == 1 ? 'avaliação' : 'avaliações'} ',
                        style: context.textStyles.bodyTextMedium.copyWith(color: context.colors.textColorMedium),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      PhosphorIconsBold.caretDown,
                      size: 16.icon,
                      color: context.colors.textColorMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8.width),
          FavoriteButton(
            isFavorite: isFavorite,
            onPressed: () {
              onFavoritePressed();
            },
          ),
        ],
      ),
    );
  }
}
