import 'package:equatable/equatable.dart';

class FavoriteRoute extends Equatable {
  final String? label;
  final String? route;

  const FavoriteRoute({this.label, this.route});

  factory FavoriteRoute.fromJson(Map<String, dynamic> json) => FavoriteRoute(
        label: json['label'] as String?,
        route: json['route'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'route': route,
      };

  @override
  List<Object?> get props => [label, route];
}
