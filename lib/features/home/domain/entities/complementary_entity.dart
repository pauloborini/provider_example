class ItemEntity {
  final String name;

  const ItemEntity({required this.name});
}

class ItemCategoryEntity {
  final String name;
  final String iconUrl;

  const ItemCategoryEntity({
    required this.name,
    required this.iconUrl,
  });
}

class PeriodEntity {
  final String formattedTime;
  final String time;
  final double price;
  final double totalPrice;
  final bool hasCourtesy;
  final PeriodDiscountEntity? discount;

  const PeriodEntity({
    required this.formattedTime,
    required this.time,
    required this.price,
    required this.totalPrice,
    required this.hasCourtesy,
    this.discount,
  });
}

class PeriodDiscountEntity {
  final double value;

  const PeriodDiscountEntity({required this.value});
}
