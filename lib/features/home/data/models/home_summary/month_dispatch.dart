import 'package:equatable/equatable.dart';

class MonthDispatch extends Equatable {
  final String? month;
  final num? delivery;
  final num? pickup;

  const MonthDispatch({this.month, this.delivery, this.pickup});

  factory MonthDispatch.fromJson(Map<String, dynamic> json) => MonthDispatch(
        month: json['month'] as String?,
        delivery: json['delivery'] as num?,
        pickup: json['pickup'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'month': month,
        'delivery': delivery,
        'pickup': pickup,
      };

  @override
  List<Object?> get props => [month, delivery, pickup];

   num get total => (delivery??0) + (pickup??0);
}
