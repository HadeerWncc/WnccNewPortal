class DispatchDeliveryEntity {
  final String id;
  final String agentName;
  bool? isSelected;
  bool enableEdit;

  DispatchDeliveryEntity({
    required this.id,
    required this.agentName,
    this.isSelected,
    this.enableEdit = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "dispatcher": agentName,
    };
  }
}
