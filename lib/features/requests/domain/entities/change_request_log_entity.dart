class ChangeRequestLogEntity {
  final String requestTypeId;
  final String requestId;
  final String comment;
  final int status;
  final bool checkedAll;

  ChangeRequestLogEntity({
    required this.requestTypeId,
    required this.requestId,
    required this.comment,
    required this.status,
    required this.checkedAll,
  });
}
