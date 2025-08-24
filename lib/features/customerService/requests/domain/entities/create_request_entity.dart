class CreateRequestEntity {
  final String id;
  final String description;
  final String contactPerson;
  final String contactPhone;
  final int level;
  final int delivery;
  final List<String> requestTypes;
  final String payerId;

  CreateRequestEntity({
    required this.id,
    required this.description,
    required this.contactPerson,
    required this.contactPhone,
    required this.level,
    required this.delivery,
    required this.requestTypes,
    required this.payerId,
  });
}
