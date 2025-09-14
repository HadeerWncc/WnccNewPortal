import 'package:equatable/equatable.dart';

import 'price.dart';

class Payer extends Equatable {
  final String? payer;
  final List<Price>? prices;

  const Payer({this.payer, this.prices});

  factory Payer.fromJson(Map<String, dynamic> json) => Payer(
        payer: json['payer'] as String?,
        prices: (json['prices'] as List<dynamic>?)
            ?.map((e) => Price.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'payer': payer,
        'prices': prices?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [payer, prices];
}
