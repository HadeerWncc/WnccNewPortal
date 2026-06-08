import 'package:equatable/equatable.dart';

import 'dispatch.dart';
import 'value.dart';

class Total extends Equatable {
  final Value? value;
  final List<Dispatch>? dispatches;

  const Total({this.value, this.dispatches});

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        value: json['value'] == null
            ? null
            : Value.fromJson(json['value'] as Map<String, dynamic>),
        dispatches: (json['dispatches'] as List<dynamic>?)
            ?.map((e) => Dispatch.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'value': value?.toJson(),
        'dispatches': dispatches?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [value, dispatches];
}
