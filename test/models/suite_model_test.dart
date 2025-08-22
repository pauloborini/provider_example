import 'package:flutter_test/flutter_test.dart';
import 'package:motels/features/home/domain/antigos/suite_model.dart';

void main() {
  group('SuiteModel', () {
    test('fromJson creates an instance from JSON', () {
      final json = {
        'nome': 'Suite 1',
        'qtd': 5,
        'exibirQtdDisponiveis': true,
        'fotos': ['https://example.com/photo1.png', 'https://example.com/photo2.png'],
        'itens': [
          {'nome': 'Item 1'},
          {'nome': 'Item 2'},
        ],
        'categoriaItens': [
          {'nome': 'Category 1', 'icone': 'https://example.com/icon1.png'},
          {'nome': 'Category 2', 'icone': 'https://example.com/icon2.png'},
        ],
        'periodos': [
          {
            'tempoFormatado': '2h',
            'tempo': '120',
            'valor': 100.0,
            'valorTotal': 80.0,
            'temCortesia': true,
            'desconto': {'desconto': 20.0},
          },
        ],
      };

      final suite = SuiteModel.fromJson(json);

      expect(suite.name, 'Suite 1');
      expect(suite.quantity, 5);
      expect(suite.showAvailableQuantity, true);
      expect(suite.photos, ['https://example.com/photo1.png', 'https://example.com/photo2.png']);
      expect(suite.items.length, 2);
      expect(suite.items[0].name, 'Item 1');
      expect(suite.items[1].name, 'Item 2');
      expect(suite.itemCategoryList.length, 2);
      expect(suite.itemCategoryList[0].name, 'Category 1');
      expect(suite.itemCategoryList[0].iconUrl, 'https://example.com/icon1.png');
      expect(suite.itemCategoryList[1].name, 'Category 2');
      expect(suite.itemCategoryList[1].iconUrl, 'https://example.com/icon2.png');
      expect(suite.periodList.length, 1);
      expect(suite.periodList[0].formattedTime, '2h');
      expect(suite.periodList[0].time, '120');
      expect(suite.periodList[0].price, 100.0);
      expect(suite.periodList[0].totalPrice, 80.0);
      expect(suite.periodList[0].hasCourtesy, true);
      expect(suite.periodList[0].discount?.value, 20.0);
    });

    test('fromJson creates an instance from JSON with empty lists', () {
      final json = {
        'nome': 'Suite 2',
        'qtd': 3,
        'exibirQtdDisponiveis': false,
        'fotos': [],
        'itens': [],
        'categoriaItens': [],
        'periodos': [],
      };

      final suite = SuiteModel.fromJson(json);

      expect(suite.name, 'Suite 2');
      expect(suite.quantity, 3);
      expect(suite.showAvailableQuantity, false);
      expect(suite.photos, isEmpty);
      expect(suite.items, isEmpty);
      expect(suite.itemCategoryList, isEmpty);
      expect(suite.periodList, isEmpty);
    });

    test('fromJson handles missing optional fields', () {
      final json = {
        'nome': 'Suite 3',
        'qtd': 2,
        'fotos': ['https://example.com/photo3.png'],
      };

      final suite = SuiteModel.fromJson(json);

      expect(suite.name, 'Suite 3');
      expect(suite.quantity, 2);
      expect(suite.showAvailableQuantity, false);
      expect(suite.photos, ['https://example.com/photo3.png']);
      expect(suite.items, isEmpty);
      expect(suite.itemCategoryList, isEmpty);
      expect(suite.periodList, isEmpty);
    });
  });
}
