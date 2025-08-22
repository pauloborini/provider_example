import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/features/home/store/home_store.dart';
import 'package:motels/features/home/view/components/city_dropdown_button.dart';
import 'package:motels/features/home/view/components/date_dropdown_button.dart';

class HeaderGoAnotherDayWidget extends StatelessWidget {
  final HomeStore store;

  const HeaderGoAnotherDayWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CityDropdownButton(store: store),
          SizedBox(width: 32.width),
          DateDropdownButton(store: store),
        ],
      ),
    );
  }
}
