import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';

class HeaderGoNowWidget extends StatelessWidget {
  final HomeViewModel homeViewModel;

  const HeaderGoNowWidget({super.key, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.height,
      child: Center(
        child: CityDropdownButton(viewModel: homeViewModel),
      ),
    );
  }
}
