import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/requests/data/mappers/request_delivery_mapper.dart';
import 'package:wncc_portal/features/requests/data/mappers/request_level_mapper.dart';
import 'package:wncc_portal/features/requests/data/mappers/request_status_mapper.dart';
import 'package:wncc_portal/features/requests/domain/entities/request_details_entity.dart';

import 'request_type.dart';

class RequestDetailsModel extends Equatable {
  final String? id;
  final String? description;
  final String? contactPerson;
  final String? contactPhone;
  final String? payerId;
  final String? payerName;
  final String? payerEmail;
  final int? level;
  final int? status;
  final int? delivery;
  final DateTime? closedAt;
  final String? createdBy;
  final String? closedBy;
  final String? result;
  final bool? isClosed;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? lastUpdatedAt;
  final List<RequestType>? requestTypes;

  const RequestDetailsModel({
    this.id,
    this.description,
    this.contactPerson,
    this.contactPhone,
    this.payerId,
    this.payerName,
    this.payerEmail,
    this.level,
    this.status,
    this.delivery,
    this.closedAt,
    this.createdBy,
    this.closedBy,
    this.result,
    this.isClosed,
    this.isDeleted,
    this.createdAt,
    this.lastUpdatedAt,
    this.requestTypes,
  });

  factory RequestDetailsModel.fromJson(Map<String, dynamic> json) {
    return RequestDetailsModel(
      id: json['id'] as String?,
      description: json['description'] as String?,
      contactPerson: json['contactPerson'] as String?,
      contactPhone: json['contactPhone'] as String?,
      payerId: json['payerId'] as String?,
      payerName: json['payerName'] as String?,
      payerEmail: json['payerEmail'] as String?,
      level: json['level'] as int?,
      status: json['status'] as int?,
      delivery: json['delivery'] as int?,
      closedAt: json['closedAt'] == null
          ? null
          : DateTime.parse(json['closedAt'] as String),
      createdBy: json['createdBy'] as String?,
      closedBy: json['closedBy'] as String?,
      result: json['result'] as String?,
      isClosed: json['isClosed'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastUpdatedAt: json['lastUpdatedAt'] == null
          ? null
          : DateTime.parse(json['lastUpdatedAt'] as String),
      requestTypes: (json['requestTypes'] as List<dynamic>?)
          ?.map((e) => RequestType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'contactPerson': contactPerson,
        'contactPhone': contactPhone,
        'payerId': payerId,
        'payerName': payerName,
        'payerEmail': payerEmail,
        'level': level,
        'status': status,
        'delivery': delivery,
        'closedAt': closedAt?.toIso8601String(),
        'createdBy': createdBy,
        'closedBy': closedBy,
        'result': result,
        'isClosed': isClosed,
        'isDeleted': isDeleted,
        'createdAt': createdAt?.toIso8601String(),
        'lastUpdatedAt': lastUpdatedAt?.toIso8601String(),
        'requestTypes': requestTypes?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      description,
      contactPerson,
      contactPhone,
      payerId,
      payerName,
      payerEmail,
      level,
      status,
      delivery,
      closedAt,
      createdBy,
      closedBy,
      result,
      isClosed,
      isDeleted,
      createdAt,
      lastUpdatedAt,
      requestTypes,
    ];
  }

  RequestDetailsEntity toEntity() {
    return RequestDetailsEntity(
      id: id,
      delivery: mapDeliveryFromInt(delivery!),
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
      requestTypes: requestTypes,
    );
  }
}
