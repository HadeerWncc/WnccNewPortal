import 'package:equatable/equatable.dart';

import 'dispatch_quantity.dart';
import 'relation_value.dart';

class DataValue extends Equatable {
  final dynamic id;
  final String? name;
  final DispatchQuantity? quantity;
  final List<RelationValue>? relationValues;

  const DataValue({this.id, this.name, this.quantity, this.relationValues});

  factory DataValue.fromJson(Map<String, dynamic> json) => DataValue(
        id: json['id'] as dynamic,
        name: json['name'] as String?,
        quantity: json['quantity'] == null
            ? null
            : DispatchQuantity.fromJson(
                json['quantity'] as Map<String, dynamic>),
        relationValues: (json['relationValues'] as List<dynamic>?)
            ?.map((e) => RelationValue.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity?.toJson(),
        'relationValues': relationValues?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, name, quantity, relationValues];
}
