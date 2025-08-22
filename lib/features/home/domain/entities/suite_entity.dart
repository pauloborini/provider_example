import 'package:motels/features/home/domain/entities/complementary_entity.dart';

class SuiteEntity {
  final String name;
  final int quantity;
  final bool showAvailableQuantity;
  final List<String> photos;
  final List<ItemEntity> items;
  final List<ItemCategoryEntity> itemCategoryList;
  final List<PeriodEntity> periodList;

  const SuiteEntity({
    required this.name,
    required this.quantity,
    required this.showAvailableQuantity,
    required this.photos,
    required this.items,
    required this.itemCategoryList,
    required this.periodList,
  });
}
