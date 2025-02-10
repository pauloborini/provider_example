import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiClient()),
        ChangeNotifierProvider(
          create: (context) => MotelRepository(
            apiClient: context.read(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => MotelService(
            motelRepo: context.read(),
          ),
        ),
      ],
      child: const AppWidget(),
    );
  }
}
