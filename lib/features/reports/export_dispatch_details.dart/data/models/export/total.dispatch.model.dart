import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/value.dart';

class Total extends Equatable {
  final String? id;
  final String? name;
  final Value? total;

  const Total({this.id, this.name, this.total});

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        id: json['id'] as String?,
        name: json['name'] as String?,
        total: json['total'] == null
            ? null
            : Value.fromJson(json['total'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'total': total?.toJson(),
      };

  @override
  List<Object?> get props => [id, name, total];
}
