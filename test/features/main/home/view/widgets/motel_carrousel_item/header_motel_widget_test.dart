import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:motels/app_exports.dart';

class MockVoidCallback extends Mock {
  void call();
}

void main() {
  testWidgets('HeaderMotelWidget displays correctly', (WidgetTester tester) async {
    final mockCallback = MockVoidCallback();

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
              body: HeaderMotelWidget(
                logoUrl: 'https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif',
                motelName: 'Motel Teste',
                motelLocation: 'Localização Teste',
                motelRating: 4.5,
                motelRatingCount: 12,
                isFavorite: true,
                onFavoritePressed: mockCallback,
              ),
            ),
          );
        },
      ),
    );

    expect(find.text('motel teste'), findsOneWidget);
    expect(find.text('localização teste'), findsOneWidget);
    expect(find.byType(CustomRenderImage), findsOneWidget);
    expect(find.byType(MotelRatingWidget), findsOneWidget);
    expect(find.byType(FavoriteButton), findsOneWidget);

    await tester.tap(find.byType(FavoriteButton));
    verify(mockCallback()).called(1);
  });
}
