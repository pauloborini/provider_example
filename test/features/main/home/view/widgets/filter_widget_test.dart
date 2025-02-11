import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motels/app_exports.dart';
import 'filter_widget_test.mocks.dart';

@GenerateMocks([HomeViewModel])
void main() {
  testWidgets('FilterWidget displays correctly', (WidgetTester tester) async {
    final mockHomeViewModel = MockHomeViewModel();

    when(mockHomeViewModel.selectedFilter).thenReturn(['filter1']);
    when(mockHomeViewModel.screenLoaded).thenReturn(ValueNotifier<bool>(true));
    when(mockHomeViewModel.itemsFilter).thenReturn(['filter1', 'filter2']);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        enableScaleWH: () => false,
        enableScaleText: () => true,
        builder: (context, child) {
          return MaterialApp(
            home: Scaffold(
              body: FilterWidget(
                homeViewModel: mockHomeViewModel,
              ),
            ),
          );
        },
      ),
    );

    expect(find.byType(FilterItem), findsNWidgets(3));
    expect(find.text('filtros'), findsOneWidget);
    expect(find.text('filter1'), findsOneWidget);
    expect(find.text('filter2'), findsOneWidget);

    await tester.tap(find.text('filter1'));
    verify(mockHomeViewModel.toggleFilter('filter1')).called(1);

    await tester.tap(find.text('filtros'));
  });
}
