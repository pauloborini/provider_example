import 'package:flutter/material.dart';
import 'package:motels/features/main/home/view/widgets/motel_carrousel_item/period_item.dart';

class PeriodListWidget extends StatelessWidget {
  const PeriodListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return const PeriodItem();
      },
    );
  }
}
