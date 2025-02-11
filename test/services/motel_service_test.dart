import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motels/app_exports.dart';

import 'motel_service_test.mocks.dart';

@GenerateMocks([MotelRepository])
void main() {
  group('MotelService', () {
    late MotelService motelService;
    late MockMotelRepository mockMotelRepository;

    setUp(() {
      mockMotelRepository = MockMotelRepository();
      motelService = MotelService(motelRepo: mockMotelRepository);
    });

    test('fetchMotels returns success status and updates motel list', () async {
      final motelList = [
        MotelModel(
          name: 'Motel 1',
          logoUrl: 'https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif',
          neighborhood: 'Bairro 1',
          distance: 1.2,
          favorites: 10,
          suites: [],
          reviewsCount: 100,
          rating: 4.5,
        ),
        MotelModel(
          name: 'Motel 2',
          logoUrl: 'https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif',
          neighborhood: 'Bairro 2',
          distance: 2.3,
          favorites: 20,
          suites: [],
          reviewsCount: 200,
          rating: 4.0,
        ),
      ];

      when(mockMotelRepository.fetchMotels()).thenAnswer((_) async => motelList);

      final result = await motelService.fetchMotels();

      expect(result.isSuccess, true);
      expect(motelService.motelList, motelList);
      verify(mockMotelRepository.fetchMotels()).called(1);
    });

    test('fetchMotels returns failure status when an exception occurs', () async {
      when(mockMotelRepository.fetchMotels()).thenThrow(Exception('Erro ao buscar motéis'));

      final result = await motelService.fetchMotels();

      expect(result.isSuccess, false);
      expect(result.message, 'Erro ao buscar motéis');
      expect(motelService.motelList, isEmpty);
      verify(mockMotelRepository.fetchMotels()).called(1);
    });
  });
}
