import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motels/core/constants/constants.dart';
import 'package:motels/core/ui/theme/custom_scroll_behavior.dart';
import 'package:motels/core/ui/theme/theme_config.dart';
import 'package:motels/features/home/di/home_di.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      enableScaleWH: () => false,
      enableScaleText: () => true,
      builder: (context, child) {
        return MaterialApp(
          scrollBehavior: CustomScrollBehavior(),
          title: AppConstants.appName,
          theme: ThemeConfig.theme,
          home: HomeDI.getPage(context),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
