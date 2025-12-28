import 'package:equatable/equatable.dart';

class SalesQuota extends Equatable {
  final String? id;
  final String? userId;
  final String? salesId;
  final String? salesName;
  final num totalQuota;
  final num deliveryBulkQuota;
  final num pickupBulkQuota;
  final num totalBulkQuota;
  final num deliveryBagsQuota;
  final num pickupBagsQuota;
  final num totalBagsQuota;
  final num pickupBulkPriority;
  final num deliveryBulkPriority;
  final num pickupBagsPriority;
  final num deliveryBagsPriority;
  final num totalBagsPriority;
  final num totalBulkPriority;
  final num pickupBulkDispatch;
  final num deliveryBulkDispatch;
  final num pickupBagsDispatch;
  final num deliveryBagsDispatch;
  final num totalBagsDispatch;
  final num totalBulkDispatch;
  final num extraBulkQuota;
  final num settelementBulkQuota;
  final num extraBagsQuota;
  final num settelementBagsQuota;
  final int? salesType;

  const SalesQuota({
    this.id,
    this.userId,
    this.salesId,
    this.salesName,
    required this.totalQuota,
    required this.deliveryBulkQuota,
    required this.pickupBulkQuota,
    required this.totalBulkQuota,
    required this.deliveryBagsQuota,
    required this.pickupBagsQuota,
    required this.totalBagsQuota,
    required this.pickupBulkPriority,
    required this.deliveryBulkPriority,
    required this.pickupBagsPriority,
    required this.deliveryBagsPriority,
    required this.totalBagsPriority,
    required this.totalBulkPriority,
    required this.pickupBulkDispatch,
    required this.deliveryBulkDispatch,
    required this.pickupBagsDispatch,
    required this.deliveryBagsDispatch,
    required this.totalBagsDispatch,
    required this.totalBulkDispatch,
    required this.extraBulkQuota,
    required this.settelementBulkQuota,
    required this.extraBagsQuota,
    required this.settelementBagsQuota,
    this.salesType,
  });

  factory SalesQuota.fromJson(Map<String, dynamic> json) => SalesQuota(
        id: json['id'] as String?,
        userId: json['userId'] as String?,
        salesId: json['salesId'] as String?,
        salesName: json['salesName'] as String?,
        totalQuota: json['totalQuota'] as num,
        deliveryBulkQuota: json['deliveryBulkQuota'] as num,
        pickupBulkQuota: json['pickupBulkQuota'] as num,
        totalBulkQuota: json['totalBulkQuota'] as num,
        deliveryBagsQuota: json['deliveryBagsQuota'] as num,
        pickupBagsQuota: json['pickupBagsQuota'] as num,
        totalBagsQuota: json['totalBagsQuota'] as num,
        pickupBulkPriority: json['pickupBulkPriority'] as num,
        deliveryBulkPriority: json['deliveryBulkPriority'] as num,
        pickupBagsPriority: json['pickupBagsPriority'] as num,
        deliveryBagsPriority: json['deliveryBagsPriority'] as num,
        totalBagsPriority: json['totalBagsPriority'] as num,
        totalBulkPriority: json['totalBulkPriority'] as num,
        pickupBulkDispatch: json['pickupBulkDispatch'] as num,
        deliveryBulkDispatch: json['deliveryBulkDispatch'] as num,
        pickupBagsDispatch: json['pickupBagsDispatch'] as num,
        deliveryBagsDispatch: json['deliveryBagsDispatch'] as num,
        totalBagsDispatch: json['totalBagsDispatch'] as num,
        totalBulkDispatch: json['totalBulkDispatch'] as num,
        extraBulkQuota: json['extraBulkQuota'] as num,
        settelementBulkQuota: json['settelementBulkQuota'] as num,
        extraBagsQuota: json['extraBagsQuota'] as num,
        settelementBagsQuota: json['settelementBagsQuota'] as num,
        salesType: json['salesType'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'salesId': salesId,
        'salesName': salesName,
        'totalQuota': totalQuota,
        'deliveryBulkQuota': deliveryBulkQuota,
        'pickupBulkQuota': pickupBulkQuota,
        'totalBulkQuota': totalBulkQuota,
        'deliveryBagsQuota': deliveryBagsQuota,
        'pickupBagsQuota': pickupBagsQuota,
        'totalBagsQuota': totalBagsQuota,
        'pickupBulkPriority': pickupBulkPriority,
        'deliveryBulkPriority': deliveryBulkPriority,
        'pickupBagsPriority': pickupBagsPriority,
        'deliveryBagsPriority': deliveryBagsPriority,
        'totalBagsPriority': totalBagsPriority,
        'totalBulkPriority': totalBulkPriority,
        'pickupBulkDispatch': pickupBulkDispatch,
        'deliveryBulkDispatch': deliveryBulkDispatch,
        'pickupBagsDispatch': pickupBagsDispatch,
        'deliveryBagsDispatch': deliveryBagsDispatch,
        'totalBagsDispatch': totalBagsDispatch,
        'totalBulkDispatch': totalBulkDispatch,
        'extraBulkQuota': extraBulkQuota,
        'settelementBulkQuota': settelementBulkQuota,
        'extraBagsQuota': extraBagsQuota,
        'settelementBagsQuota': settelementBagsQuota,
        'salesType': salesType,
      };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      salesId,
      salesName,
      totalQuota,
      deliveryBulkQuota,
      pickupBulkQuota,
      totalBulkQuota,
      deliveryBagsQuota,
      pickupBagsQuota,
      totalBagsQuota,
      pickupBulkPriority,
      deliveryBulkPriority,
      pickupBagsPriority,
      deliveryBagsPriority,
      totalBagsPriority,
      totalBulkPriority,
      pickupBulkDispatch,
      deliveryBulkDispatch,
      pickupBagsDispatch,
      deliveryBagsDispatch,
      totalBagsDispatch,
      totalBulkDispatch,
      extraBulkQuota,
      settelementBulkQuota,
      extraBagsQuota,
      settelementBagsQuota,
      salesType,
    ];
  }
}
