import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';

class PeriodListWidget extends StatelessWidget {
  final List<PeriodModel> periodList;

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
