import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';

class SkeletonMotelItem extends StatelessWidget {
  const SkeletonMotelItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.width),
      child: Column(
        children: [
          SizedBox(height: 32.height),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 16.width),
              ClipOval(
                child: SkeletonWidget(
                  width: 50.width,
                  height: 50.height,
                ),
              ),
              SizedBox(width: 32.width),
              Expanded(
                child: SkeletonWidget(width: 300.width, height: 80.height),
              ),
              SizedBox(width: 16.width),
            ],
          ),
          SizedBox(height: 16.height),
          SkeletonWidget(width: double.maxFinite, height: 240.height),
          SizedBox(height: 8.height),
          SkeletonWidget(width: double.maxFinite, height: 80.height),
          SizedBox(height: 8.height),
          SkeletonWidget(width: double.maxFinite, height: 80.height),
          SizedBox(height: 8.height),
          SkeletonWidget(width: double.maxFinite, height: 80.height),
        ],
      ),
    );
  }
}
