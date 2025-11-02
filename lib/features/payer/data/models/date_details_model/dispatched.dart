import 'package:equatable/equatable.dart';

class Dispatched extends Equatable {
  final int? bags;
  final int? bulk;

  const Dispatched({this.bags, this.bulk});

  factory Dispatched.fromJson(Map<String, dynamic> json) => Dispatched(
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
