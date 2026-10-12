import 'package:equatable/equatable.dart';

import 'action_by.dart';

class Datum extends Equatable {
  final String? id;
  final String? subject;
  final String? description;
  final bool? isPrivate;
  final bool? isSpecified;
  final bool? isDeleted;
  final bool? isDeactivated;
  final bool? isBelong;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ActionBy? createdBy;
  final ActionBy? updatedBy;

  const Datum({
    this.id,
    this.subject,
    this.description,
    this.isPrivate,
    this.isSpecified,
    this.isDeleted,
    this.isDeactivated,
    this.isBelong,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as String?,
        subject: json['subject'] as String?,
        description: json['description'] as String?,
        isPrivate: json['isPrivate'] as bool?,
        isSpecified: json['isSpecified'] as bool?,
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
            : ActionBy.fromJson(json['createdBy'] as Map<String, dynamic>),
        updatedBy: json['updatedBy'] == null
            ? null
            : ActionBy.fromJson(json['updatedBy'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'subject': subject,
        'description': description,
        'isPrivate': isPrivate,
        'isSpecified': isSpecified,
        'isDeleted': isDeleted,
        'isDeactivated': isDeactivated,
        'isBelong': isBelong,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'createdBy': createdBy?.toJson(),
        'updatedBy': updatedBy?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      subject,
      description,
      isPrivate,
      isSpecified,
      isDeleted,
      isDeactivated,
      isBelong,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
    ];
  }
}
