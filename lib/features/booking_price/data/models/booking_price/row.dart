import 'package:equatable/equatable.dart';

class Row extends Equatable {
  final String? name;
  final List<dynamic>? values;

  const Row({this.name, this.values});

  factory Row.fromJson(Map<String, dynamic> json) => Row(
        name: json['name'] as String?,
        values: json['values'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'values': values,
      };

  @override
  List<Object?> get props => [name, values];
}
