import 'package:equatable/equatable.dart';

class Region extends Equatable {
  final String? area;
  final List<Region>? regions;

  const Region({this.area, this.regions});

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        area: json['area'] as String?,
        regions: (json['regions'] as List<dynamic>?)
            ?.map((e) => Region.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'area': area,
        'regions': regions?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [area, regions];
}
