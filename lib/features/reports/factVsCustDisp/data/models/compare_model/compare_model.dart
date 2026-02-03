import 'package:equatable/equatable.dart';
import 'fact_compare_item.dart';

class CompareModel extends Equatable {
  final List<FactCompareItem>? compare;
  final List<FactCompareItem>? selected;
  final List<FactCompareItem>? difference;

  const CompareModel({this.compare, this.selected, this.difference});

  factory CompareModel.fromJson(Map<String, dynamic> json) => CompareModel(
        compare: (json['compare'] as List<dynamic>?)
            ?.map((e) => FactCompareItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        selected: (json['selected'] as List<dynamic>?)
            ?.map((e) => FactCompareItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        difference: (json['difference'] as List<dynamic>?)
            ?.map((e) => FactCompareItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'compare': compare?.map((e) => e.toJson()).toList(),
        'selected': selected?.map((e) => e.toJson()).toList(),
        'difference': difference?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [compare, selected, difference];
}
