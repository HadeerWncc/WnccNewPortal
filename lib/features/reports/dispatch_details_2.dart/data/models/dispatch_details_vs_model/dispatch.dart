import 'package:equatable/equatable.dart';

import 'value.dart';

class Dispatch extends Equatable {
  final String? id;
  final String? name;
  final Value? value;
  final List<dynamic>? dispatches;

  const Dispatch({this.id, this.name, this.value, this.dispatches});

  factory Dispatch.fromJson(Map<String, dynamic> json) => Dispatch(
        id: json['id'] as String?,
        name: json['name'] as String?,
        value: json['value'] == null
            ? null
            : Value.fromJson(json['value'] as Map<String, dynamic>),
        dispatches: json['dispatches'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'value': value?.toJson(),
        'dispatches': dispatches,
      };

  @override
  List<Object?> get props => [id, name, value, dispatches];
}
