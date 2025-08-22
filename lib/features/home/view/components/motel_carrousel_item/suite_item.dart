import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:motels/core/ui/styles/text_styles.dart';
import 'package:motels/core/widgets/custom_render_image.dart';
import 'package:motels/features/home/domain/entities/suite_entity.dart';
import 'package:motels/features/home/view/components/motel_carrousel_item/category_row_widget.dart';
import 'package:motels/features/home/view/components/motel_carrousel_item/period_list_widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SuiteItem extends StatelessWidget {
  final SuiteEntity suite;

  const SuiteItem({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.width),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(8.adaptive),
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
                    child: CustomRenderImage(
                      imageUrl: suite.photos[0],
                      fit: BoxFit.fill,
                      width: double.maxFinite,
                      height: 240.height,
                    ),
                  ),
                  SizedBox(height: 12.height),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.width),
                    height: 60.height,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          suite.name.toLowerCase(),
                          style: context.textStyles.bodyTextMedium.copyWith(
                            fontSize: 21.font,
                            color: context.colors.textColorMedium,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                        if (suite.showAvailableQuantity) ...[
                          SizedBox(height: 6.height),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(PhosphorIconsFill.warningOctagon, size: 16.icon, color: context.colors.primary),
                              SizedBox(width: 4.width),
                              Text(
                                'só mais ${suite.quantity} pelo app',
                                style: context.textStyles.bodyTextMedium
                                    .copyWith(color: context.colors.primary, fontSize: 13.font),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.height),
            CategoryRowWidget(
              categoryList: suite.itemCategoryList,
            ),
            SizedBox(height: 8.height),
            PeriodListWidget(
              periodList: suite.periodList,
            ),
          ],
        ),
      ),
    );
  }
}
