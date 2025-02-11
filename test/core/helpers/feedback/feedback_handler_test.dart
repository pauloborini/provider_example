import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:motels/app_exports.dart';

void main() {
  testWidgets('FeedbackHandler shows success SnackBar', (WidgetTester tester) async {
    final testKey = GlobalKey<ScaffoldState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          key: testKey,
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  FeedbackHandler.showSnackBar(
                    context: context,
                    isSuccess: true,
                    message: 'Success message',
                  );
                },
                child: const Text('Show SnackBar'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show SnackBar'));
    await tester.pump(); // Start the SnackBar animation

    expect(find.text('Success message'), findsOneWidget);
    expect(
      (tester.widget(find.byType(SnackBar)) as SnackBar).backgroundColor,
      Color(0xff1bb98e), // Substitua por context.colors.supportGreen se necessário
    );
  });

  testWidgets('FeedbackHandler shows failure SnackBar', (WidgetTester tester) async {
    final testKey = GlobalKey<ScaffoldState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          key: testKey,
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  FeedbackHandler.showSnackBar(
                    context: context,
                    isSuccess: false,
                    message: 'Failure message',
                  );
                },
                child: const Text('Show SnackBar'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show SnackBar'));
    await tester.pump();

    expect(find.text('Failure message'), findsOneWidget);
    expect(
      (tester.widget(find.byType(SnackBar)) as SnackBar).backgroundColor,
      Color(0xffffb200),
    );
  });
}
