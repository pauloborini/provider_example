import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/core/ui/styles/colors_app.dart';
import 'package:motels/features/home/store/home_store.dart';
import 'package:motels/features/home/view/components/motel_carrousel_item/motel_carrousel_item.dart';

class GoNowBody extends StatelessWidget {
  final HomeStore store;

  const GoNowBody({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await store.setupConfigs();
      },
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: context.colors.neutralShade100,
        child: ListView.separated(
          padding: EdgeInsets.only(top: 16.height),
          shrinkWrap: true,
          itemCount: store.motelList.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 32.height);
          },
          itemBuilder: (context, index) {
            final motel = store.motelList[index];
            return MotelCarrouselItem(
              motel: motel,
              isFavorite: store.favoriteTempList.contains(motel.name),
              onFavoritePressed: () {
                _toggleFavorite(motel.name);
              },
            );
          },
        ),
      ),
    );
  }

  void _toggleFavorite(String motelName) {
    store.toggleTempFavorite(motelName);
  }
}
