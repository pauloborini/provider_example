import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';

///TODO voltar para fazer a lista

class CategoryRowWidget extends StatelessWidget {
  final List<ItemCategoryModel> categoryList;

  const CategoryRowWidget({super.key, required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16.adaptive),
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
          SizedBox(
            height: 56.adaptive,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categoryList.length > 4 ? 4 : categoryList.length,
              separatorBuilder: (context, index) {
                return SizedBox(width: 8.width);
              },
              itemBuilder: (context, index) {
                return CategoryItem(iconUrl: categoryList[index].iconUrl);
              },
            ),
          ),
          SizedBox(width: 16.width),
          const SeeMoreWidget(),
        ],
      ),
    );
  }
}
