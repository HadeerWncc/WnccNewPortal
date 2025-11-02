import 'package:equatable/equatable.dart';

import 'quantity.dart';

class DateDetailsModel extends Equatable {
  final String? date;
  final Quantity? quantity;

  const DateDetailsModel({this.date, this.quantity});

  factory DateDetailsModel.fromJson(Map<String, dynamic> json) {
    return DateDetailsModel(
      date: json['date'] as String?,
      quantity: json['quantity'] == null
          ? null
          : Quantity.fromJson(json['quantity'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'quantity': quantity?.toJson(),
      };

  @override
  List<Object?> get props => [date, quantity];
}
