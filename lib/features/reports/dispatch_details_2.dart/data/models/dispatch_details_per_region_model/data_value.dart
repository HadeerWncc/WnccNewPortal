import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/value.dart';

import 'relation_value.dart';

class DataValue extends Equatable {
  final dynamic id;
  final String? name;
  final dynamic total;
  final Value? quantity;
  final List<RelationValue>? relationValues;

  const DataValue({
    this.id,
    this.name,
    this.total,
    this.quantity,
    this.relationValues,
  });

  factory DataValue.fromJson(Map<String, dynamic> json) => DataValue(
        id: json['id'] as dynamic,
        name: json['name'] as String?,
        total: json['total'] as dynamic,
        quantity: json['quantity'] == null
            ? null
            : Value.fromJson(json['quantity'] as Map<String, dynamic>),
        relationValues: (json['relationValues'] as List<dynamic>?)
            ?.map((e) => RelationValue.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'total': total,
        'quantity': quantity?.toJson(),
        'relationValues': relationValues?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, name, total, quantity, relationValues];
}
