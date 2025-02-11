import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motels/app_exports.dart';
import 'go_now_body_test.mocks.dart';

@GenerateMocks([HomeViewModel])
void main() {
  testWidgets('GoNowBody displays correctly', (WidgetTester tester) async {
    final mockHomeViewModel = MockHomeViewModel();

    when(mockHomeViewModel.motelList).thenReturn([
      MotelModel(
        name: 'Motel 1',
        logoUrl: 'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg',
        neighborhood: 'Bairro 1',
        distance: 1.2,
        favorites: 10,
        suites: [],
        reviewsCount: 100,
        rating: 4.5,
      ),
    ]);
    when(mockHomeViewModel.favoriteTempList).thenReturn(['Motel 1']);
    when(mockHomeViewModel.setupConfigs()).thenAnswer((_) async {});

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
              body: GoNowBody(
                homeViewModel: mockHomeViewModel,
              ),
            ),
          );
        },
      ),
    );

    expect(find.byType(MotelCarrouselItem), findsNWidgets(1));
    await tester.pump(const Duration(seconds: 1));
    await tester.fling(find.byType(ListView), const Offset(0, -300), 1000);
    await tester.pump(const Duration(seconds: 1));
  });
}
