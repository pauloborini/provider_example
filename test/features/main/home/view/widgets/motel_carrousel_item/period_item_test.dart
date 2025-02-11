import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motels/app_exports.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'period_item_test.mocks.dart';

@GenerateMocks([PeriodModel])
void main() {
  late MockPeriodModel mockPeriodModel;

  setUp(() {
    mockPeriodModel = MockPeriodModel();

    when(mockPeriodModel.formattedTime).thenReturn('3 horas');
    when(mockPeriodModel.time).thenReturn('3');
    when(mockPeriodModel.price).thenReturn(100.0);
    when(mockPeriodModel.totalPrice).thenReturn(80.0);
    when(mockPeriodModel.hasCourtesy).thenReturn(false);
    when(mockPeriodModel.discount).thenReturn(PeriodDiscountModel(value: 20.0));
  });

  testWidgets('PeriodItem displays correctly', (WidgetTester tester) async {
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
              body: PeriodItem(
                periodModel: mockPeriodModel,
              ),
            ),
          );
        },
      ),
    );

    expect(find.text('3 horas'), findsOneWidget);
    expect(find.byType(DiscountTagWidget), findsOneWidget);
    expect(find.byType(PriceDisplayWidget), findsOneWidget);
    expect(find.byIcon(PhosphorIconsBold.caretRight), findsOneWidget);
  });
}
