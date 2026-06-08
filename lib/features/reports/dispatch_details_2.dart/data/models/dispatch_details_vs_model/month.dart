import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/total.dart';

class Month extends Equatable {
  final String? name;
  final String? date;
  final Total? value;

  const Month({this.name, this.date, this.value});

  factory Month.fromJson(Map<String, dynamic> json) => Month(
        name: json['name'] as String?,
        date: json['date'] as String?,
        value: json['value'] == null
            ? null
            : Total.fromJson(json['value'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'date': date,
        'value': value?.toJson(),
      };

  @override
  List<Object?> get props => [name, date, value];
}
