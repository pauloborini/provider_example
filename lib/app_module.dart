import 'package:flutter/material.dart';
import 'package:motels/app_widget.dart';
import 'package:motels/core/utils/di/di_container.dart';
import 'package:motels/core/utils/di/di_provider.dart';
import 'package:motels/shared/api/api_client.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return DiProvider(
      container: _createAppContainer(),
      child: const AppWidget(),
    );
  }

  DiContainer _createAppContainer() {
    final container = DiContainer();
    container.add<ApiClient>(ApiClient());

    return container;
  }
}
