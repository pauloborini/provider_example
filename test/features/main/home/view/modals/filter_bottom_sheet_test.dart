import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motels/app_exports.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'filter_bottom_sheet_test.mocks.dart';

@GenerateMocks([HomeViewModel])
void main() {
  group('FilterBottomSheet', () {
    late MockHomeViewModel mockHomeViewModel;

    setUp(() {
      mockHomeViewModel = MockHomeViewModel();
    });

    testWidgets('displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          enableScaleWH: () => false,
          enableScaleText: () => true,
          builder: (context, child) {
            return MaterialApp(
              home: FilterBottomSheet(homeViewModel: mockHomeViewModel),
            );
          },
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('filtros'), findsOneWidget);
      expect(find.byIcon(PhosphorIconsBold.caretDown), findsOneWidget);
      expect(find.text('limpar'), findsOneWidget);
    });

    testWidgets('calls clearFilters on clear button press', (WidgetTester tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          enableScaleWH: () => false,
          enableScaleText: () => true,
          builder: (context, child) {
            return MaterialApp(
              home: FilterBottomSheet(homeViewModel: mockHomeViewModel),
            );
          },
        ),
      );

      await tester.tap(find.text('limpar'));
      verify(mockHomeViewModel.clearFilters()).called(1);
    });

    testWidgets('pops the navigator on leading button press', (WidgetTester tester) async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          enableScaleWH: () => false,
          enableScaleText: () => true,
          builder: (context, child) {
            return MaterialApp(
              home: Navigator(
                onGenerateRoute: (_) => MaterialPageRoute(
                  builder: (context) => FilterBottomSheet(homeViewModel: mockHomeViewModel),
                ),
              ),
            );
          },
        ),
      );

      await tester.tap(find.byIcon(PhosphorIconsBold.caretDown));
      await tester.pumpAndSettle();

      expect(find.byType(FilterBottomSheet), findsNothing);
    });
  });
}
