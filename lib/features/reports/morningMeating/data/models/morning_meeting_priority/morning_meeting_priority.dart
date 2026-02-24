import 'package:equatable/equatable.dart';

import 'priority.dart';

class MorningMeetingPriority extends Equatable {
  final String? date;
  final Priority? delivery;
  final Priority? pickup;

  const MorningMeetingPriority({this.date, this.delivery, this.pickup});

  factory MorningMeetingPriority.fromJson(Map<String, dynamic> json) {
    return MorningMeetingPriority(
      date: json['date'] as String?,
      delivery: json['delivery'] == null
          ? null
          : Priority.fromJson(json['delivery'] as Map<String, dynamic>),
      pickup: json['pickup'] == null
          ? null
          : Priority.fromJson(json['pickup'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'delivery': delivery?.toJson(),
        'pickup': pickup?.toJson(),
      };

  @override
  List<Object?> get props => [date, delivery, pickup];
}
