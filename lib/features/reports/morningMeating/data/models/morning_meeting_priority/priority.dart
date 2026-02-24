import 'package:equatable/equatable.dart';

class Priority extends Equatable {
  final num? bags;
  final num? bulk;

  const Priority({this.bags, this.bulk});

  factory Priority.fromJson(Map<String, dynamic> json) => Priority(
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
