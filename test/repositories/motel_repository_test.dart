import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motels/app_exports.dart';

import 'motel_repository_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MotelRepository motelRepository;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    motelRepository = MotelRepository(apiClient: mockApiClient);
  });

  group('fetchMotels', () {
    test('should return a list of motels when the API call is successful', () async {
      final mockResponse = {
        'sucesso': true,
        'data': {
          'pagina': 1,
          'qtdPorPagina': 10,
          'totalSuites': 0,
          'totalMoteis': 1,
          'raio': 0,
          'maxPaginas': 1.0,
          'moteis': [
            {
              'fantasia': 'Motel 1 Fantasia',
              'bairro': 'Bairro 1',
              'media': 4.5,
              'qtdAvaliacoes': 100,
              'distancia': 2,
              'qtdFavoritos': 2,
              'logo': 'url1',
              'suites': [],
            },
            {
              'fantasia': 'Motel 2 Fantasia',
              'bairro': 'Bairro 2',
              'media': 4.0,
              'qtdAvaliacoes': 50,
              'distancia': 3,
              'qtdFavoritos': 2,
              'logo': 'url2',
              'suites': [],
            },
          ],
        },
      };

      when(mockApiClient.getData('/')).thenAnswer((_) async => mockResponse);

      final motels = await motelRepository.fetchMotels();

      expect(motels, isA<List<MotelModel>>());
      expect(motels.length, 2);
      expect(motels[0].name, 'Motel 1 Fantasia');
      expect(motels[1].name, 'Motel 2 Fantasia');
    });

    test('should throw an exception when the API call fails', () async {
      when(mockApiClient.getData('/')).thenThrow(Exception('API Error'));

      expect(() async => motelRepository.fetchMotels(), throwsA(isA<Exception>()));
    });

    test('should throw an exception when the API response is invalid', () async {
      final mockResponse = {
        'data': {
          'moteis': [
            {
              'id': 1,
              'fantasia': 'Motel 1',
              'bairro': 'Bairro 1',
              'media': 4.5,
              'qtdAvaliacoes': 100,
              'distancia': 2,
              'qtdFavoritos': 2,
              'logo': 'url1',
              'suites': null,
            },
          ],
        },
      };

      when(mockApiClient.getData('/')).thenAnswer((_) async => mockResponse);

      expect(() async => motelRepository.fetchMotels(), throwsA(isA<TypeError>()));
    });
  });
}
