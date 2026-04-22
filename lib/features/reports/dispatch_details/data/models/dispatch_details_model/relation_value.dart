import 'package:equatable/equatable.dart';

import 'dispatch_quantity.dart';

class RelationValue extends Equatable {
  final String? id;
  final String? name;
  final DispatchQuantity? quantity;
  final List<dynamic>? relationValues;

  const RelationValue({
    this.id,
    this.name,
    this.quantity,
    this.relationValues,
  });

  factory RelationValue.fromJson(Map<String, dynamic> json) => RelationValue(
        id: json['id'] as String?,
        name: json['name'] as String?,
        quantity: json['quantity'] == null
            ? null
            : DispatchQuantity.fromJson(
                json['quantity'] as Map<String, dynamic>),
        relationValues: json['relationValues'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity?.toJson(),
        'relationValues': relationValues,
      };

  @override
  List<Object?> get props => [id, name, quantity, relationValues];
}
