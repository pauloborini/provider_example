import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motels/app_exports.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'home_appbar_test.mocks.dart';

@GenerateMocks([HomeViewModel])
void main() {
  testWidgets('HomeAppBar displays correctly', (WidgetTester tester) async {
    final mockHomeViewModel = MockHomeViewModel();

    when(mockHomeViewModel.selectedIndex).thenReturn(0);

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
              appBar: HomeAppBar(
                homeViewModel: mockHomeViewModel,
              ),
            ),
          );
        },
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byIcon(PhosphorIconsRegular.list), findsOneWidget);
    expect(find.byIcon(PhosphorIconsRegular.magnifyingGlass), findsOneWidget);
    expect(find.text('ir agora'), findsOneWidget);
    expect(find.text('ir outro dia'), findsOneWidget);

    await tester.tap(find.text('ir outro dia'));
    verify(mockHomeViewModel.setSelectedIndex(1)).called(1);
  });
}
