import 'package:equatable/equatable.dart';

import 'created_by.dart';
import 'updated_by.dart';

class UpdatesModel extends Equatable {
  final String? id;
  final String? content;
  final bool? isDeleted;
  final bool? isDeactivated;
  final bool? isBelong;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final CreatedBy? createdBy;
  final UpdatedBy? updatedBy;
  final List<dynamic>? attachments;

  const UpdatesModel({
    this.id,
    this.content,
    this.isDeleted,
    this.isDeactivated,
    this.isBelong,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.attachments,
  });

  factory UpdatesModel.fromJson(Map<String, dynamic> json) => UpdatesModel(
        id: json['id'] as String?,
        content: json['content'] as String?,
        isDeleted: json['isDeleted'] as bool?,
        isDeactivated: json['isDeactivated'] as bool?,
        isBelong: json['isBelong'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        createdBy: json['createdBy'] == null
            ? null
            : CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
        updatedBy: json['updatedBy'] == null
            ? null
            : UpdatedBy.fromJson(json['updatedBy'] as Map<String, dynamic>),
        attachments: json['attachments'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'isDeleted': isDeleted,
        'isDeactivated': isDeactivated,
        'isBelong': isBelong,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'createdBy': createdBy?.toJson(),
        'updatedBy': updatedBy?.toJson(),
        'attachments': attachments,
      };

  @override
  List<Object?> get props {
    return [
      id,
      content,
      isDeleted,
      isDeactivated,
      isBelong,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
      attachments,
    ];
  }
}
