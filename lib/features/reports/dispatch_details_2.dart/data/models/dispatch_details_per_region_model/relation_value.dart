import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/value.dart';


class RelationValue extends Equatable {
  final String? id;
  final String? name;
  final dynamic total;
  final Value? quantity;
  final List<dynamic>? relationValues;

  const RelationValue({
    this.id,
    this.name,
    this.total,
    this.quantity,
    this.relationValues,
  });

  factory RelationValue.fromJson(Map<String, dynamic> json) => RelationValue(
        id: json['id'] as String?,
        name: json['name'] as String?,
        total: json['total'] as dynamic,
        quantity: json['quantity'] == null
            ? null
            : Value.fromJson(json['quantity'] as Map<String, dynamic>),
        relationValues: json['relationValues'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'total': total,
        'quantity': quantity?.toJson(),
        'relationValues': relationValues,
      };

  @override
  List<Object?> get props => [id, name, total, quantity, relationValues];
}
