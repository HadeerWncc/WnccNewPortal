import 'package:equatable/equatable.dart';

class Delivery extends Equatable {
  final num? bags;
  final num? bulk;

  const Delivery({this.bags, this.bulk});

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        bags: json['bags'] as num?,
        bulk: json['bulk'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'bags': bags,
        'bulk': bulk,
      };

  @override
  List<Object?> get props => [bags, bulk];
}
