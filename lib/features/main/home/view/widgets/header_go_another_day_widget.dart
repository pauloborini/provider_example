import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';

class HeaderGoAnotherDayWidget extends StatelessWidget {
  final HomeViewModel viewModel;

  const HeaderGoAnotherDayWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CityDropdownButton(viewModel: viewModel),
          SizedBox(width: 32.width),
          DateDropdownButton(viewModel: viewModel),
        ],
      ),
    );
  }
}
