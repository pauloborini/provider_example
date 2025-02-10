import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';

///TODO voltar para fazer a lista

class CategoryRowWidget extends StatelessWidget {
  const CategoryRowWidget({super.key});

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
        children: [
          const CategoryItem(
            iconUrl: 'https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png',
          ),
          SizedBox(width: 16.width),
          const SeeMoreWidget(),
        ],
      ),
    );
  }
}
