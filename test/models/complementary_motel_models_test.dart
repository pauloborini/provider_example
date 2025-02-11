import 'package:flutter_test/flutter_test.dart';
import 'package:motels/app_exports.dart';

void main() {
  group('ItemModel', () {
    test('fromJson creates an instance from JSON', () {
      final json = {'nome': 'Item 1'};
      final item = ItemModel.fromJson(json);

      expect(item.name, 'Item 1');
    });
  });

  group('ItemCategoryModel', () {
    test('fromJson creates an instance from JSON', () {
      final json = {'nome': 'Category 1', 'icone': 'https://example.com/icon.png'};
      final category = ItemCategoryModel.fromJson(json);

      expect(category.name, 'Category 1');
      expect(category.iconUrl, 'https://example.com/icon.png');
    });
  });

  group('PeriodModel', () {
    test('fromJson creates an instance from JSON', () {
      final json = {
        'tempoFormatado': '2h',
        'tempo': '120',
        'valor': 100.0,
        'valorTotal': 80.0,
        'temCortesia': true,
        'desconto': {'desconto': 20.0},
      };
      final period = PeriodModel.fromJson(json);

      expect(period.formattedTime, '2h');
      expect(period.time, '120');
      expect(period.price, 100.0);
      expect(period.totalPrice, 80.0);
      expect(period.hasCourtesy, true);
      expect(period.discount?.value, 20.0);
    });

    test('fromJson creates an instance from JSON without discount', () {
      final json = {
        'tempoFormatado': '2h',
        'tempo': '120',
        'valor': 100.0,
        'valorTotal': 80.0,
        'temCortesia': true,
      };
      final period = PeriodModel.fromJson(json);

      expect(period.formattedTime, '2h');
      expect(period.time, '120');
      expect(period.price, 100.0);
      expect(period.totalPrice, 80.0);
      expect(period.hasCourtesy, true);
      expect(period.discount, isNull);
    });
  });

  group('PeriodDiscountModel', () {
    test('fromJson creates an instance from JSON', () {
      final json = {'desconto': 20.0};
      final discount = PeriodDiscountModel.fromJson(json);

      expect(discount.value, 20.0);
    });
  });
}
