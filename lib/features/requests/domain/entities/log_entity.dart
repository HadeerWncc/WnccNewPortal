import 'package:wncc_portal/features/requests/domain/enums/request_status_enum.dart';

class LogEntity {
  final String? id;
  final String createdAt;
  final RequestStatus changedFrom;
  final RequestStatus changedTo;
  final dynamic comment;
  final String? createdBy;
  final dynamic imageUrl;
  final bool? isChanged;

  LogEntity({
    required this.id,
    required this.createdAt,
    required this.changedFrom,
    required this.changedTo,
    required this.comment,
    required this.createdBy,
    required this.imageUrl,
    required this.isChanged,
  });
}
