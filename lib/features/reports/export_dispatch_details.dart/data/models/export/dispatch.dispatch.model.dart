import 'package:equatable/equatable.dart';

import 'total.dispatch.model.dart';

class Dispatch extends Equatable {
  final String? id;
  final String? name;
  final String? salesName;
  final List<Total>? total;

  const Dispatch({this.id, this.name, this.salesName, this.total});

  factory Dispatch.fromJson(Map<String, dynamic> json) => Dispatch(
        id: json['id'] as String?,
        name: json['name'] as String?,
        salesName: json['salesName'] as String?,
        total: (json['total'] as List<dynamic>?)
            ?.map((e) => Total.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'salesName': salesName,
        'total': total?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, name, salesName, total];
}
