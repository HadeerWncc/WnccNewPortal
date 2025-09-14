import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final int? pickup;
  final int? delivery;

  const Price({this.pickup, this.delivery});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        pickup: json['pickup'] as int?,
        delivery: json['delivery'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'pickup': pickup,
        'delivery': delivery,
      };

  @override
  List<Object?> get props => [pickup, delivery];
}
