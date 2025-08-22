import 'package:flutter/material.dart';
import 'package:motels/core/utils/di/di_container.dart';
import 'package:motels/core/utils/di/di_provider.dart';
import 'package:motels/features/home/datasource/home_datasource.dart';
import 'package:motels/features/home/repository/home_repository.dart';
import 'package:motels/features/home/store/home_store.dart';
import 'package:motels/features/home/view/home_page.dart';
import 'package:motels/shared/api/api_client.dart';

class HomeDI {
  HomeDI._();
  static DiContainer _createContainer(BuildContext context) {
    final appContainer = context.diContainer;
    final container = DiContainer();

    final apiClient = appContainer.get<ApiClient>();

    final homeDatasource = HomeDatasource(apiClient: apiClient);
    container.add<IHomeDatasource>(homeDatasource);

    final homeRepository = HomeRepository(homeDatasource: homeDatasource);
    container.add<IHomeRepository>(homeRepository);

    container.addFactory<HomeStore>(() => HomeStore(homeRepository: homeRepository));

    return container;
  }

  static Widget getPage(BuildContext context) {
    return DiProvider(
      container: _createContainer(context),
      child: const HomePage(),
    );
  }
}
