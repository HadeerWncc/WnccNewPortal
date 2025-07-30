import 'package:equatable/equatable.dart';

class ForwardUser extends Equatable {
  final String? id;
  final String? forwardFrom;
  final String? forwardToId;
  final String? forwardTo;
  final String? imageUrl;
  final String? forwardReason;
  final bool? isViewed;
  final dynamic viewedAt;
  final DateTime? forwardedAt;

  const ForwardUser({
    this.id,
    this.forwardFrom,
    this.forwardToId,
    this.forwardTo,
    this.imageUrl,
    this.forwardReason,
    this.isViewed,
    this.viewedAt,
    this.forwardedAt,
  });

  factory ForwardUser.fromJson(Map<String, dynamic> json) => ForwardUser(
        id: json['id'] as String?,
        forwardFrom: json['forwardFrom'] as String?,
        forwardToId: json['forwardToId'] as String?,
        forwardTo: json['forwardTo'] as String?,
        imageUrl: json['imageUrl'] as String?,
        forwardReason: json['forwardReason'] as String?,
        isViewed: json['isViewed'] as bool?,
        viewedAt: json['viewedAt'] as dynamic,
        forwardedAt: json['forwardedAt'] == null
            ? null
            : DateTime.parse(json['forwardedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'forwardFrom': forwardFrom,
        'forwardToId': forwardToId,
        'forwardTo': forwardTo,
        'imageUrl': imageUrl,
        'forwardReason': forwardReason,
        'isViewed': isViewed,
        'viewedAt': viewedAt,
        'forwardedAt': forwardedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      forwardFrom,
      forwardToId,
      forwardTo,
      imageUrl,
      forwardReason,
      isViewed,
      viewedAt,
      forwardedAt,
    ];
  }
}
