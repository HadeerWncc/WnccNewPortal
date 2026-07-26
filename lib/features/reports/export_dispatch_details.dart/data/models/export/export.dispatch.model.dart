import 'package:equatable/equatable.dart';

import 'dispatch.dispatch.model.dart';
import 'total.dispatch.model.dart';

class Export extends Equatable {
  final int? mode;
  final String? date;
  final String? displayDate;
  final int? index;
  final List<Dispatch>? dispatches;
  final List<Total>? total;

  const Export({
    this.mode,
    this.date,
    this.displayDate,
    this.index,
    this.dispatches,
    this.total,
  });

  factory Export.fromJson(Map<String, dynamic> json) => Export(
        mode: json['mode'] as int?,
        date: json['date'] as String?,
        displayDate: json['displayDate'] as String?,
        index: json['index'] as int?,
        dispatches: (json['dispatches'] as List?)
                ?.map((e) => Dispatch.fromJson(e))
                .toList() ??
            [],
        total:
            (json['total'] as List?)?.map((e) => Total.fromJson(e)).toList() ??
                [],
      );

  Map<String, dynamic> toJson() => {
        'mode': mode,
        'date': date,
        'displayDate': displayDate,
        'index': index,
        'dispatches': dispatches?.map((e) => e.toJson()).toList(),
        'total': total?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      mode,
      date,
      displayDate,
      index,
      dispatches,
      total,
    ];
  }
}
