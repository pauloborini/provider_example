import 'package:flutter/material.dart';
import 'package:motels/core/helpers/extensions/responsive_extension.dart';
import 'package:motels/features/home/view/components/motel_carrousel_item/period_item.dart';
import 'package:motels/features/main/home/domain/entities/complementary_entity.dart';

class PeriodListWidget extends StatelessWidget {
  final List<PeriodEntity> periodList;

  const PeriodListWidget({super.key, required this.periodList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: periodList.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: 8.height);
      },
      itemBuilder: (context, index) {
        return PeriodItem(periodModel: periodList[index]);
      },
    );
  }
}
