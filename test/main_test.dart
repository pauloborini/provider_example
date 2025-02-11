import 'package:flutter_test/flutter_test.dart';
import 'package:motels/app_exports.dart';

void main() {
  testWidgets('AppModule is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const AppModule());

    expect(find.byType(AppModule), findsOneWidget);
  });
}
