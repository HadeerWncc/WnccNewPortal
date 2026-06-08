import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/total.dart';

class DispatchValue extends Equatable {
  final String? name;
  final Total? value;

  const DispatchValue({this.name, this.value});

  factory DispatchValue.fromJson(Map<String, dynamic> json) => DispatchValue(
        name: (json['name'] as String?)?.toString(),
        value: json['value'] == null
            ? null
            : Total.fromJson(json['value'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value?.toJson(),
      };

  @override
  List<Object?> get props => [name, value];
}
