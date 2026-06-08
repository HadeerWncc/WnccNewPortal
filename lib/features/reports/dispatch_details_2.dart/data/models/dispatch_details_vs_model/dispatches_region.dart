
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_vs_model/disptch_value.dart';

class DispatchesRegion extends Equatable {
  final String? id;
  final String? name;
  final List<DispatchValue>? dispatches;

  const DispatchesRegion({this.id, this.name, this.dispatches});

  factory DispatchesRegion.fromJson(Map<String, dynamic> json) => DispatchesRegion(
        id: json['id'] as String?,
        name: json['name'] as String?,
        dispatches: (json['dispatches'] as List<dynamic>?)
          ?.map((e) => DispatchValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'dispatches': dispatches,
      };

  @override
  List<Object?> get props => [id, name, dispatches];
}