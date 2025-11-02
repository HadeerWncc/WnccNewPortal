import 'package:equatable/equatable.dart';

class MonthTarget extends Equatable {
  final String? id;
  final int? bags;
  final int? bulk;
  final String? date;

  const MonthTarget({this.id, this.bags, this.bulk, this.date});

  factory MonthTarget.fromJson(Map<String, dynamic> json) => MonthTarget(
        id: json['id'] as String?,
        bags: json['bags'] as int?,
        bulk: json['bulk'] as int?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'bags': bags,
        'bulk': bulk,
        'date': date,
      };

  @override
  List<Object?> get props => [id, bags, bulk, date];
}
