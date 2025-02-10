import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MotelCarrouselItem extends StatelessWidget {
  final VoidCallback onFavoritePressed;

  const MotelCarrouselItem({
    super.key,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderMotelWidget(
          logoUrl: 'https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif',
          motelName: 'Flirt Motel',
          motelLocation: 'fortaleza - blumenau',
          motelRating: 4.6,
          motelRatingCount: 21,
          isFavorite: false,
          onFavoritePressed: () => onFavoritePressed(),
        ),
        SizedBox(height: 12.height),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(12.adaptive),
          decoration: BoxDecoration(
            color: context.colors.neutralWhite,
            borderRadius: BorderRadius.circular(8.adaptive),
            boxShadow: [
              BoxShadow(
                color: context.colors.neutralShade200,
                offset: const Offset(0, 2),
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.adaptive),
                child: const CustomRenderImage(
                  imageUrl: 'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg',
                  fit: BoxFit.fill,
                  width: double.maxFinite,
                ),
              ),
              SizedBox(height: 12.height),
              Text(
                'suíte class',
                style: context.textStyles.bodyTextMedium.copyWith(
                  fontSize: 21.font,
                  color: context.colors.textColorMedium,
                ),
              ),
              SizedBox(height: 4.height),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(PhosphorIconsFill.warningOctagon, size: 16.icon, color: context.colors.primary),
                  SizedBox(width: 4.width),
                  Text(
                    'só mais 3 pelo app',
                    style: context.textStyles.bodyTextMedium.copyWith(color: context.colors.primary, fontSize: 13.font),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8.height),
        const CategoryRowWidget(),
        SizedBox(height: 8.height),
        const PeriodListWidget(),
      ],
    );
  }
}
