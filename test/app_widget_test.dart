import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motels/app_exports.dart';
import 'package:provider/provider.dart';

import 'app_widget_test.mocks.dart';

@GenerateMocks([ApiClient, MotelRepository, MotelService])
void main() {
  late MockApiClient mockApiClient;
  late MockMotelRepository mockMotelRepository;
  late MockMotelService mockMotelService;

  setUp(() {
    mockApiClient = MockApiClient();
    mockMotelRepository = MockMotelRepository();
    mockMotelService = MockMotelService();
  });

  testWidgets('AppModule start providers', (WidgetTester tester) async {
    when(mockApiClient.getData(any)).thenAnswer((_) async => {'sucesso': true});

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ApiClient>.value(value: mockApiClient),
          ChangeNotifierProvider<MotelRepository>.value(value: mockMotelRepository),
          ChangeNotifierProvider<MotelService>.value(value: mockMotelService),
        ],
        child: const AppModule(),
      ),
    );

    expect(find.byType(AppWidget), findsOneWidget);
  });
}
