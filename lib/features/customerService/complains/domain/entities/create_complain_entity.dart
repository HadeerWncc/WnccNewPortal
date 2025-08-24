class CreateComplainEntity {
  final String? id;
  final String subject;
  final String type;
  final String description;
  final String contactPerson;
  final String contactPhone;
  final int level;
  // final Array images;
  final String payerId;

  CreateComplainEntity({
    this.id,
    required this.subject,
    required this.type,
    required this.description,
    required this.contactPerson,
    required this.contactPhone,
    required this.level,
    required this.payerId,
  });
}
