class ItemModel {
  final String name;

  ItemModel({required this.name});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['nome'] as String,
    );
  }
}

class ItemCategoryModel {
  final String name;
  final String iconUrl;

  ItemCategoryModel({
    required this.name,
    required this.iconUrl,
  });

  factory ItemCategoryModel.fromJson(Map<String, dynamic> json) {
    return ItemCategoryModel(
      name: json['nome'] as String,
      iconUrl: json['icone'] as String,
    );
  }
}

class PeriodModel {
  final String formattedTime;
  final String time;
  final double price;
  final double totalPrice;
  final bool hasCourtesy;
  final PeriodDiscountModel? discount;

  PeriodModel({
    required this.formattedTime,
    required this.time,
    required this.price,
    required this.totalPrice,
    required this.hasCourtesy,
    this.discount,
  });

  factory PeriodModel.fromJson(Map<String, dynamic> json) {
    final discount = json['desconto'] as Map<String, dynamic>?;

    return PeriodModel(
      formattedTime: json['tempoFormatado'] as String,
      time: json['tempo'] as String,
      price: (json['valor'] as num).toDouble(),
      totalPrice: (json['valorTotal'] as num).toDouble(),
      hasCourtesy: json['temCortesia'] as bool,
      discount: discount != null ? PeriodDiscountModel.fromJson(discount) : null,
    );
  }
}

class PeriodDiscountModel {
  final double value;

  PeriodDiscountModel({required this.value});

  factory PeriodDiscountModel.fromJson(Map<String, dynamic> json) {
    return PeriodDiscountModel(
      value: (json['desconto'] as num).toDouble(),
    );
  }
}
