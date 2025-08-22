import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:motels/features/home/domain/entities/complementary_entity.dart';
import 'package:motels/features/home/view/components/motel_carrousel_item/category_item.dart';
import 'package:motels/features/home/view/components/motel_carrousel_item/see_more_widget.dart';

class CategoryRowWidget extends StatelessWidget {
  final List<ItemCategoryEntity> categoryList;

  const CategoryRowWidget({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(12.adaptive),
      height: 80.adaptive,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: SizedBox(
              height: 56.adaptive,
              width: 240.width,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: categoryList.length > 4 ? 4 : categoryList.length,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: categoryList.length > 4 ? 4 : categoryList.length,
                itemBuilder: (context, index) {
                  return CategoryItem(iconUrl: categoryList[index].iconUrl);
                },
              ),
            ),
          ),
          SizedBox(width: 16.width),
          const SeeMoreWidget(),
        ],
      ),
    );
  }
}
