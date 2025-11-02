import 'package:equatable/equatable.dart';

import 'dispatched.dart';
import 'pending.dart';
import 'priorited.dart';

class Delivery extends Equatable {
  final Pending? pending;
  final Priorited? priorited;
  final Dispatched? dispatched;
  final int? total;
  final int? totalCount;

  const Delivery({
    this.pending,
    this.priorited,
    this.dispatched,
    this.total,
    this.totalCount,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        pending: json['pending'] == null
            ? null
            : Pending.fromJson(json['pending'] as Map<String, dynamic>),
        priorited: json['priorited'] == null
            ? null
            : Priorited.fromJson(json['priorited'] as Map<String, dynamic>),
        dispatched: json['dispatched'] == null
            ? null
            : Dispatched.fromJson(json['dispatched'] as Map<String, dynamic>),
        total: json['total'] as int?,
        totalCount: json['totalCount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'pending': pending?.toJson(),
        'priorited': priorited?.toJson(),
        'dispatched': dispatched?.toJson(),
        'total': total,
        'totalCount': totalCount,
      };

  @override
  List<Object?> get props {
    return [
      pending,
      priorited,
      dispatched,
      total,
      totalCount,
    ];
  }
}
