import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SuiteItem extends StatelessWidget {
  final SuiteModel suiteModel;

  const SuiteItem({super.key, required this.suiteModel});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    imageUrl: suiteModel.photos[0],
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
                        suiteModel.name.toLowerCase(),
                        style: context.textStyles.bodyTextMedium.copyWith(
                          fontSize: 21.font,
                          color: context.colors.textColorMedium,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                      if (suiteModel.showAvailableQuantity) ...[
                        SizedBox(height: 6.height),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(PhosphorIconsFill.warningOctagon, size: 16.icon, color: context.colors.primary),
                            SizedBox(width: 4.width),
                            Text(
                              'só mais ${suiteModel.quantity} pelo app',
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
            categoryList: suiteModel.itemCategoryList,
          ),
          SizedBox(height: 8.height),
          PeriodListWidget(
            periodList: suiteModel.periodList,
          ),
        ],
      ),
    );
  }
}
