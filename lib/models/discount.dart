class Discount {
  final double discount;

  Discount({required this.discount});

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(discount: json['desconto'].toDouble());
  }
}
