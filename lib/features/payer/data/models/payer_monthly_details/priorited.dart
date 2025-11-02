import 'package:equatable/equatable.dart';

class Priorited extends Equatable {
  final int? bags;
  final int? bulk;

  const Priorited({this.bags, this.bulk});

  factory Priorited.fromJson(Map<String, dynamic> json) => Priorited(
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
