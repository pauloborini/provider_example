import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';
import 'package:provider/provider.dart';

class HomeRoute {
  HomeRoute._();

  static Widget get screen {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(
            motelService: context.read(),
          ),
          lazy: false,
        ),
      ],
      builder: (context, child) {
        return const HomeScreen();
      },
    );
  }
}
