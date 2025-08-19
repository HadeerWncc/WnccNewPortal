import 'package:wncc_portal/features/requests/domain/entities/request_type_entity.dart';
import 'package:wncc_portal/features/requests/domain/enums/request_delivery_enum.dart';
import 'package:wncc_portal/features/requests/domain/enums/request_level_enum.dart';
import 'package:wncc_portal/features/requests/domain/enums/request_status_enum.dart';

class RequestDetailsEntity {
  final String? id;
  final String? description;
  final String? contactPerson;
  final String? contactPhone;
  final String? payerId;
  final String? payerName;
  final String? payerEmail;
  final SupportLevel level;
  final SupportStatus status;
  final RequestDelivery delivery;
  final DateTime? closedAt;
  final String? createdBy;
  final String? closedBy;
  final String? result;
  final bool? isClosed;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? lastUpdatedAt;
  final List<RequestTypeEntity>? requestTypes;

  const RequestDetailsEntity({
    this.id,
    this.description,
    this.contactPerson,
    this.contactPhone,
    this.payerId,
    this.payerName,
    this.payerEmail,
    required this.level,
    required this.status,
    required this.delivery,
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
}
