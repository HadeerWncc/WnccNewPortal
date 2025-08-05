import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:wncc_portal/features/requests/data/models/mappers/request_status_mapper.dart';
import 'package:wncc_portal/features/requests/domain/entities/log_entity.dart';

class Log extends Equatable {
  final String? id;
  final DateTime? createdAt;
  final int? changedFrom;
  final int? changedTo;
  final dynamic comment;
  final String? createdBy;
  final dynamic imageUrl;
  final bool? isChanged;

  const Log({
    this.id,
    this.createdAt,
    this.changedFrom,
    this.changedTo,
    this.comment,
    this.createdBy,
    this.imageUrl,
    this.isChanged,
  });

  factory Log.fromJson(Map<String, dynamic> json) => Log(
        id: json['id'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        changedFrom: json['changedFrom'] as int?,
        changedTo: json['changedTo'] as int?,
        comment: json['comment'] as dynamic,
        createdBy: json['createdBy'] as String?,
        imageUrl: json['imageUrl'] as dynamic,
        isChanged: json['isChanged'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt?.toIso8601String(),
        'changedFrom': changedFrom,
        'changedTo': changedTo,
        'comment': comment,
        'createdBy': createdBy,
        'imageUrl': imageUrl,
        'isChanged': isChanged,
      };

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      changedFrom,
      changedTo,
      comment,
      createdBy,
      imageUrl,
      isChanged,
    ];
  }

  LogEntity toEntity() {
    return LogEntity(
      id: id,
      createdAt: createdAt != null
          ? DateFormat('d/M/yyyy h:m').format(createdAt!)
          : "",
      changedFrom: mapStatusFromInt(changedFrom!),
      changedTo: mapStatusFromInt(changedTo!),
      comment: comment,
      createdBy: createdBy,
      imageUrl: imageUrl,
      isChanged: isChanged,
    );
  }
}
