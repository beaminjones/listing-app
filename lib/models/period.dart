import 'package:motel_listing_app/models/discount.dart';

class Period {
  final String formattedTime;
  final String time;
  final double value;
  final double totalValue;
  final bool hasCourtesy;
  final Discount? discount;

  Period({
    required this.formattedTime,
    required this.time,
    required this.value,
    required this.totalValue,
    required this.hasCourtesy,
    this.discount,
  });

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      formattedTime: json['tempoFormatado'],
      time: json['tempo'],
      value: json['valor'].toDouble(),
      totalValue: json['valorTotal'].toDouble(),
      hasCourtesy: json['temCortesia'],
      discount:
          json['desconto'] != null ? Discount.fromJson(json['desconto']) : null,
    );
  }
}
