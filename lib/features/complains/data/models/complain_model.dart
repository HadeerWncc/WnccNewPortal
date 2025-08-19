import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/complains/domain/entities/complain_entity.dart';
import 'package:wncc_portal/features/requests/data/models/mappers/request_level_mapper.dart';
import 'package:wncc_portal/features/requests/data/models/mappers/request_status_mapper.dart';

class ComplainModel extends Equatable {
  final String? id;
  final String? subject;
  final String? type;
  final String? description;
  final String? contactPerson;
  final String? contactPhone;
  final String? payerId;
  final String? payerName;
  final String? payerEmail;
  final int? level;
  final int? status;
  final dynamic closedAt;
  final dynamic closedBy;
  final dynamic result;
  final bool? isClosed;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? lastUpdatedAt;
  final String? createdBy;

  const ComplainModel({
    this.id,
    this.subject,
    this.type,
    this.description,
    this.contactPerson,
    this.contactPhone,
    this.payerId,
    this.payerName,
    this.payerEmail,
    this.level,
    this.status,
    this.closedAt,
    this.closedBy,
    this.result,
    this.isClosed,
    this.isDeleted,
    this.createdAt,
    this.lastUpdatedAt,
    this.createdBy,
  });

  factory ComplainModel.fromJson(Map<String, dynamic> json) => ComplainModel(
        id: json['id'] as String?,
        subject: json['subject'] as String?,
        type: json['type'] as String?,
        description: json['description'] as String?,
        contactPerson: json['contactPerson'] as String?,
        contactPhone: json['contactPhone'] as String?,
        payerId: json['payerId'] as String?,
        payerName: json['payerName'] as String?,
        payerEmail: json['payerEmail'] as String?,
        level: json['level'] as int?,
        status: json['status'] as int?,
        closedAt: json['closedAt'] as dynamic,
        closedBy: json['closedBy'] as dynamic,
        result: json['result'] as dynamic,
        isClosed: json['isClosed'] as bool?,
        isDeleted: json['isDeleted'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        lastUpdatedAt: json['lastUpdatedAt'] == null
            ? null
            : DateTime.parse(json['lastUpdatedAt'] as String),
        createdBy: json['createdBy'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'subject': subject,
        'type': type,
        'description': description,
        'contactPerson': contactPerson,
        'contactPhone': contactPhone,
        'payerId': payerId,
        'payerName': payerName,
        'payerEmail': payerEmail,
        'level': level,
        'status': status,
        'closedAt': closedAt,
        'closedBy': closedBy,
        'result': result,
        'isClosed': isClosed,
        'isDeleted': isDeleted,
        'createdAt': createdAt?.toIso8601String(),
        'lastUpdatedAt': lastUpdatedAt?.toIso8601String(),
        'createdBy': createdBy,
      };

  @override
  List<Object?> get props {
    return [
      id,
      subject,
      type,
      description,
      contactPerson,
      contactPhone,
      payerId,
      payerName,
      payerEmail,
      level,
      status,
      closedAt,
      closedBy,
      result,
      isClosed,
      isDeleted,
      createdAt,
      lastUpdatedAt,
      createdBy,
    ];
  }

  ComplainEntity toEntity() {
    return ComplainEntity(
      id: id,
      subject: subject,
      type: type,
      description: description,
      contactPerson: contactPerson,
      contactPhone: contactPhone,
      payerId: payerId,
      payerName: payerName,
      payerEmail: payerEmail,
      level: mapLevelFromInt(level!),
      status: mapStatusFromInt(status!),
      closedAt: closedAt,
      createdBy: createdBy,
      closedBy: closedBy,
      result: result,
      isClosed: isClosed,
      isDeleted: isDeleted,
      createdAt: createdAt,
      lastUpdatedAt: lastUpdatedAt,
    );
  }
}
