import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';

class MotelCarrouselItem extends StatefulWidget {
  final MotelModel motelModel;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const MotelCarrouselItem({
    super.key,
    required this.motelModel,
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
      children: [
        HeaderMotelWidget(
          logoUrl: widget.motelModel.logoUrl,
          motelName: widget.motelModel.name,
          motelLocation: widget.motelModel.neighborhood,
          motelRating: widget.motelModel.rating,
          motelRatingCount: widget.motelModel.reviewsCount,
          isFavorite: widget.isFavorite,
          onFavoritePressed: () => widget.onFavoritePressed(),
        ),
        SizedBox(height: 20.height),
        SizedBox(
          height: context.percentHeight(0.85),
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.motelModel.suites.length,
            onPageChanged: (index) {},
            itemBuilder: (context, index) {
              final suite = widget.motelModel.suites[index];
              return SuiteItem(suiteModel: suite);
            },
          ),
        ),
      ],
    );
  }
}
