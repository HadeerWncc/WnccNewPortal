import 'package:equatable/equatable.dart';

class Pending extends Equatable {
  final int? bags;
  final int? bulk;

  const Pending({this.bags, this.bulk});

  factory Pending.fromJson(Map<String, dynamic> json) => Pending(
        bags: json['bags'] as int?,
        bulk: json['bulk'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'bags': bags,
        'bulk': bulk,
      };

  @override
  List<Object?> get props => [bags, bulk];
}
