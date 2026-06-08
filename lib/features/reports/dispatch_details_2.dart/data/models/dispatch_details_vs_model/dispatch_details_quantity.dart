import 'package:equatable/equatable.dart';

class DispatchDetailsQuantity extends Equatable {
  final num? bags;
  final num? bulk;
  final num? total;

  const DispatchDetailsQuantity({this.bags, this.bulk, this.total});

  factory DispatchDetailsQuantity.fromJson(Map<String, dynamic> json) {
    return DispatchDetailsQuantity(
      bags: json['bags'] as num?,
      bulk: json['bulk'] as num?,
      total: json['total'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
        'bags': bags,
        'bulk': bulk,
        'total': total,
      };

  @override
  List<Object?> get props => [bags, bulk, total];
}
