import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motels/app_exports.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([MotelService])
void main() {
  group('HomeViewModel', () {
    late HomeViewModel homeViewModel;
    late MockMotelService mockMotelService;

    setUp(() {
      mockMotelService = MockMotelService();
      homeViewModel = HomeViewModel(motelService: mockMotelService);
    });

    test('setupConfigs sets screenLoaded to true after fetching motels', () async {
      when(mockMotelService.fetchMotels()).thenAnswer((_) async => StatusResult.success(''));

      await homeViewModel.setupConfigs();

      expect(homeViewModel.screenLoaded.value, true);
      verify(mockMotelService.fetchMotels()).called(1);
    });

    test('toggleTempFavorite adds and removes favorite correctly', () {
      homeViewModel.toggleTempFavorite('Motel 1');
      expect(homeViewModel.favoriteTempList, contains('Motel 1'));

      homeViewModel.toggleTempFavorite('Motel 1');
      expect(homeViewModel.favoriteTempList, isNot(contains('Motel 1')));
    });

    test('toggleFilter adds and removes filter correctly', () {
      homeViewModel.toggleFilter('Filter 1');
      expect(homeViewModel.selectedFilter, contains('Filter 1'));

      homeViewModel.toggleFilter('Filter 1');
      expect(homeViewModel.selectedFilter, isNot(contains('Filter 1')));
    });

    test('clearFilters clears all selected filters', () {
      homeViewModel.toggleFilter('Filter 1');
      homeViewModel.toggleFilter('Filter 2');
      homeViewModel.clearFilters();
      expect(homeViewModel.selectedFilter, isEmpty);
    });

    test('selectedCity setter updates the selected city', () {
      homeViewModel.selectedCity = 'Rio de Janeiro';
      expect(homeViewModel.selectedCity, 'Rio de Janeiro');
    });

    test('selectedInitialDate setter updates the selected initial date', () {
      homeViewModel.selectedInitialDate = '12 fev';
      expect(homeViewModel.selectedInitialDate, '12 fev');
    });

    test('selectedFinalDate setter updates the selected final date', () {
      homeViewModel.selectedFinalDate = '13 fev';
      expect(homeViewModel.selectedFinalDate, '13 fev');
    });
  });
}
