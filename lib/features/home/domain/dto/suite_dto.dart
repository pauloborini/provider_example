import 'package:motels/features/home/domain/dto/complementary_dto.dart';

class SuiteDTO {
  final String name;
  final int quantity;
  final bool showAvailableQuantity;
  final List<String> photos;
  final List<ItemDTO> items;
  final List<ItemCategoryDTO> itemCategoryList;
  final List<PeriodDTO> periodList;

  SuiteDTO({
    required this.name,
    required this.quantity,
    required this.showAvailableQuantity,
    required this.photos,
    required this.items,
    required this.itemCategoryList,
    required this.periodList,
  });
}
