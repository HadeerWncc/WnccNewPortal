import 'package:equatable/equatable.dart';

class MessageDto extends Equatable {
  final String? id;
  final String? createdById;
  final String? createdBy;
  final dynamic imageUrl;
  final String? reply;
  final DateTime? createdAt;
  final dynamic viewedAt;
  final bool? isViewd;
  final bool? isBelong;

  const MessageDto({
    this.id,
    this.createdById,
    this.createdBy,
    this.imageUrl,
    this.reply,
    this.createdAt,
    this.viewedAt,
    this.isViewd,
    this.isBelong,
  });

  factory MessageDto.fromJson(Map<String, dynamic> json) => MessageDto(
        id: json['id'] as String?,
        createdById: json['createdById'] as String?,
        createdBy: json['createdBy'] as String?,
        imageUrl: json['imageUrl'] as dynamic,
        reply: json['reply'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        viewedAt: json['viewedAt'] as dynamic,
        isViewd: json['isViewd'] as bool?,
        isBelong: json['isBelong'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdById': createdById,
        'createdBy': createdBy,
        'imageUrl': imageUrl,
        'reply': reply,
        'createdAt': createdAt?.toIso8601String(),
        'viewedAt': viewedAt,
        'isViewd': isViewd,
        'isBelong': isBelong,
      };

  @override
  List<Object?> get props {
    return [
      id,
      createdById,
      createdBy,
      imageUrl,
      reply,
      createdAt,
      viewedAt,
      isViewd,
      isBelong,
    ];
  }
}
