import 'package:wncc_portal/features/requests/domain/entities/log_entity.dart';
import 'package:wncc_portal/features/requests/domain/enums/request_status_enum.dart';

class RequestTypeEntity {
  final String id;
  final String name;
  final SupportStatus status;
  final List<LogEntity>? logs;

  RequestTypeEntity(
      {required this.id,
      required this.name,
      required this.status,
      required this.logs});
}
