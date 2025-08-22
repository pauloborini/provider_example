class ItemDTO {
  final String name;

  ItemDTO({required this.name});
}

class ItemCategoryDTO {
  final String name;
  final String iconUrl;

  ItemCategoryDTO({
    required this.name,
    required this.iconUrl,
  });
}

class PeriodDTO {
  final String formattedTime;
  final String time;
  final double price;
  final double totalPrice;
  final bool hasCourtesy;
  final PeriodDiscountDTO? discount;

  PeriodDTO({
    required this.formattedTime,
    required this.time,
    required this.price,
    required this.totalPrice,
    required this.hasCourtesy,
    this.discount,
  });
}

class PeriodDiscountDTO {
  final double value;

  PeriodDiscountDTO({required this.value});
}
