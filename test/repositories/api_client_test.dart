import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motels/app_exports.dart';
import 'api_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('ApiClient', () {
    late ApiClient apiClient;
    late MockClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockClient();
      apiClient = ApiClient();
    });

    test('getData return success', () async {
      const endpoint = '/';
      final responseJson = {'sucesso': true};
      final response = http.Response(json.encode(responseJson), 200);

      when(mockHttpClient.get(Uri.parse('${AppConstants.baseURL}$endpoint'))).thenAnswer((_) async => response);

      final result = await apiClient.getData(endpoint);

      expect(result['sucesso'], true);
    });

    test('getData return 404', () async {
      final endpoint = '/test-endpoint';
      final response = http.Response('Not Found', 404);

      when(mockHttpClient.get(Uri.parse('${AppConstants.baseURL}$endpoint'))).thenAnswer((_) async => response);

      expect(() => apiClient.getData(endpoint), throwsException);
    });
  });
}
