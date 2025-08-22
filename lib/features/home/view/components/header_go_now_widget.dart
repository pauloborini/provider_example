import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/features/home/store/home_store.dart';
import 'package:motels/features/home/view/components/city_dropdown_button.dart';

class HeaderGoNowWidget extends StatelessWidget {
  final HomeStore store;

  const HeaderGoNowWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.height,
      child: Center(
        child: CityDropdownButton(store: store),
      ),
    );
  }
}
