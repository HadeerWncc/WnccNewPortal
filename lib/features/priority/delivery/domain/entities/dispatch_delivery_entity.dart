class DispatchDeliveryEntity {
  final String id;
  final String agentName;

  DispatchDeliveryEntity({required this.id, required this.agentName});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "dispatcher": agentName,
    };
  }
}
