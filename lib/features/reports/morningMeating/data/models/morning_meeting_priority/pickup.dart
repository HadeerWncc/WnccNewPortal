import 'package:equatable/equatable.dart';

class Pickup extends Equatable {
  final num? bags;
  final num? bulk;

  const Pickup({this.bags, this.bulk});

  factory Pickup.fromJson(Map<String, dynamic> json) => Pickup(
        bags: json['bags'] as num?,
        bulk: (json['bulk'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'bags': bags,
        'bulk': bulk,
      };

  @override
  List<Object?> get props => [bags, bulk];
}
