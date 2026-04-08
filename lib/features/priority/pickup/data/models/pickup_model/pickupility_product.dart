import 'package:equatable/equatable.dart';

class PickupilityProduct extends Equatable {
  final String? materialId;
  final String? materialName;
  final String? materialDescription;
  final int? materialType;
  final num? quantity;
  final num? prioritedQnty;
  final num? dispatchedQnty;
  final num? remainingQnty;
  final num? actualDispatchedQnty;
  final num? actualRemainingQnty;
  final dynamic lastPrioritedAt;
  final dynamic lastDispatchedAt;
  final dynamic lastPrioritedBy;
  final dynamic lastDispatchedBy;

  const PickupilityProduct({
    this.materialId,
    this.materialName,
    this.materialDescription,
    this.materialType,
    this.quantity,
    this.prioritedQnty,
    this.dispatchedQnty,
    this.remainingQnty,
    this.actualDispatchedQnty,
    this.actualRemainingQnty,
    this.lastPrioritedAt,
    this.lastDispatchedAt,
    this.lastPrioritedBy,
    this.lastDispatchedBy,
  });

  factory PickupilityProduct.fromJson(Map<String, dynamic> json) {
    return PickupilityProduct(
      materialId: json['materialId'] as String?,
      materialName: json['materialName'] as String?,
      materialDescription: json['materialDescription'] as String?,
      materialType: json['materialType'] as int?,
      quantity: json['quantity'] as num?,
      prioritedQnty: json['prioritedQnty'] as num?,
      dispatchedQnty: json['dispatchedQnty'] as num?,
      remainingQnty: json['remainingQnty'] as num?,
      actualDispatchedQnty: json['actualDispatchedQnty'] as num?,
      actualRemainingQnty: json['actualRemainingQnty'] as num?,
      lastPrioritedAt: json['lastPrioritedAt'] as dynamic,
      lastDispatchedAt: json['lastDispatchedAt'] as dynamic,
      lastPrioritedBy: json['lastPrioritedBy'] as dynamic,
      lastDispatchedBy: json['lastDispatchedBy'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'materialId': materialId,
        'materialName': materialName,
        'materialDescription': materialDescription,
        'materialType': materialType,
        'quantity': quantity,
        'prioritedQnty': prioritedQnty,
        'dispatchedQnty': dispatchedQnty,
        'remainingQnty': remainingQnty,
        'actualDispatchedQnty': actualDispatchedQnty,
        'actualRemainingQnty': actualRemainingQnty,
        'lastPrioritedAt': lastPrioritedAt,
        'lastDispatchedAt': lastDispatchedAt,
        'lastPrioritedBy': lastPrioritedBy,
        'lastDispatchedBy': lastDispatchedBy,
      };

  @override
  List<Object?> get props {
    return [
      materialId,
      materialName,
      materialDescription,
      materialType,
      quantity,
      prioritedQnty,
      dispatchedQnty,
      remainingQnty,
      actualDispatchedQnty,
      actualRemainingQnty,
      lastPrioritedAt,
      lastDispatchedAt,
      lastPrioritedBy,
      lastDispatchedBy,
    ];
  }
}
