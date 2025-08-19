import 'package:wncc_portal/features/requests/domain/entities/log_entity.dart';
import 'package:wncc_portal/features/requests/domain/enums/request_level_enum.dart';
import 'package:wncc_portal/features/requests/domain/enums/request_status_enum.dart';

class ComplainDetailsEntity {
  final String? id;
  final String? subject;
  final String? type;
  final String? description;
  final String? contactPerson;
  final String? contactPhone;
  final String? payerId;
  final String? payerName;
  final String? payerEmail;
  final SupportLevel? level;
  final SupportStatus? status;
  final dynamic closedAt;
  final dynamic closedBy;
  final dynamic result;
  final bool? isClosed;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? lastUpdatedAt;
  final String? createdBy;
  final List<dynamic>? images;
  final List<LogEntity>? logs;

  ComplainDetailsEntity({
    required this.id,
    required this.subject,
    required this.type,
    required this.description,
    required this.contactPerson,
    required this.contactPhone,
    required this.payerId,
    required this.payerName,
    required this.payerEmail,
    required this.level,
    required this.status,
    required this.closedAt,
    required this.closedBy,
    required this.result,
    required this.isClosed,
    required this.isDeleted,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.createdBy,
    required this.images,
    required this.logs,
  });
}
