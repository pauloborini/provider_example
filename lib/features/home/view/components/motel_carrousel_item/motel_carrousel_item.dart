import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/features/home/domain/entities/motel_entity.dart';
import 'package:motels/features/home/view/components/motel_carrousel_item/header_motel_widget.dart';
import 'package:motels/features/home/view/components/motel_carrousel_item/suite_item.dart';

class MotelCarrouselItem extends StatefulWidget {
  final MotelEntity motel;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const MotelCarrouselItem({
    super.key,
    required this.motel,
    required this.onFavoritePressed,
    required this.isFavorite,
  });

  @override
  State<MotelCarrouselItem> createState() => _MotelCarrouselItemState();
}

class _MotelCarrouselItemState extends State<MotelCarrouselItem> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.92);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeaderMotelWidget(
          logoUrl: widget.motel.logoUrl,
          motelName: widget.motel.name,
          motelLocation: widget.motel.neighborhood,
          motelRating: widget.motel.rating,
          motelRatingCount: widget.motel.reviewsCount,
          isFavorite: widget.isFavorite,
          onFavoritePressed: () => widget.onFavoritePressed(),
        ),
        SizedBox(height: 20.height),
        SizedBox(
          height: 820.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.motel.suites.length,
            onPageChanged: (index) {},
            itemBuilder: (context, index) {
              final suite = widget.motel.suites[index];
              return SuiteItem(suite: suite);
            },
          ),
        ),
      ],
    );
  }
}
