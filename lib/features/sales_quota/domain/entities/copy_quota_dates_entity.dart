class CopyQuotaDateEntity {
  final String date;
  final String copyToDate;

  CopyQuotaDateEntity({
    required this.date,
    required this.copyToDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "copyToDate": copyToDate,
    };
  }
}
