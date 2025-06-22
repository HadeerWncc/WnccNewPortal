import 'package:equatable/equatable.dart';

class SalesQuota extends Equatable {
  final String? id;
  final int? salesType;
  final String? userId;
  final String? salesId;
  final String? salesName;
  final dynamic totalQuota;
  final dynamic deliveryBulkQuota;
  final dynamic pickupBulkQuota;
  final dynamic totalBulkQuota;
  final dynamic totalBulkPriority;
  final dynamic deliveryBagsQuota;
  final dynamic pickupBagsQuota;
  final dynamic totalBagsQuota;
  final dynamic totalBagsPriority;
  final dynamic pickupBulkPriority;
  final dynamic deliveryBulkPriority;
  final dynamic pickupBagsPriority;
  final dynamic deliveryBagsPriority;
  final dynamic extraBulkQuota;
  final dynamic settelementBulkQuota;
  final dynamic extraBagsQuota;
  final dynamic settelementBagsQuota;

  const SalesQuota({
    this.id,
    this.salesType,
    this.userId,
    this.salesId,
    this.salesName,
    this.totalQuota,
    this.deliveryBulkQuota,
    this.pickupBulkQuota,
    this.totalBulkQuota,
    this.deliveryBagsQuota,
    this.pickupBagsQuota,
    this.totalBagsQuota,
    this.pickupBulkPriority,
    this.deliveryBulkPriority,
    this.pickupBagsPriority,
    this.deliveryBagsPriority,
    this.extraBulkQuota,
    this.settelementBulkQuota,
    this.extraBagsQuota,
    this.settelementBagsQuota,
    this.totalBulkPriority,
    this.totalBagsPriority,
  });

  SalesQuota copyWith({
    String? id,
    int? salesType,
    String? userId,
    String? salesId,
    String? salesName,
    dynamic totalQuota,
    dynamic deliveryBulkQuota,
    dynamic pickupBulkQuota,
    dynamic totalBulkQuota,
    dynamic deliveryBagsQuota,
    dynamic pickupBagsQuota,
    dynamic totalBagsQuota,
    dynamic pickupBulkPriority,
    dynamic deliveryBulkPriority,
    dynamic pickupBagsPriority,
    dynamic deliveryBagsPriority,
    dynamic extraBulkQuota,
    dynamic settelementBulkQuota,
    dynamic extraBagsQuota,
    dynamic settelementBagsQuota,
  }) {
    return SalesQuota(
      id: id ?? this.id,
      salesType: salesType ?? this.salesType,
      userId: userId ?? this.userId,
      salesId: salesId ?? this.salesId,
      salesName: salesName ?? this.salesName,
      totalQuota: totalQuota ?? this.totalQuota,
      deliveryBulkQuota: deliveryBulkQuota ?? this.deliveryBulkQuota,
      pickupBulkQuota: pickupBulkQuota ?? this.pickupBulkQuota,
      totalBulkQuota: totalBulkQuota ?? this.totalBulkQuota,
      deliveryBagsQuota: deliveryBagsQuota ?? this.deliveryBagsQuota,
      pickupBagsQuota: pickupBagsQuota ?? this.pickupBagsQuota,
      totalBagsQuota: totalBagsQuota ?? this.totalBagsQuota,
      pickupBulkPriority: pickupBulkPriority ?? this.pickupBulkPriority,
      deliveryBulkPriority: deliveryBulkPriority ?? this.deliveryBulkPriority,
      pickupBagsPriority: pickupBagsPriority ?? this.pickupBagsPriority,
      deliveryBagsPriority: deliveryBagsPriority ?? this.deliveryBagsPriority,
      extraBulkQuota: extraBulkQuota ?? this.extraBulkQuota,
      settelementBulkQuota: settelementBulkQuota ?? this.settelementBulkQuota,
      extraBagsQuota: extraBagsQuota ?? this.extraBagsQuota,
      settelementBagsQuota: settelementBagsQuota ?? this.settelementBagsQuota,
    );
  }

  factory SalesQuota.fromJson(Map<String, dynamic> json) => SalesQuota(
        id: json['id'] as String?,
        salesType: json['salesType'] as int?,
        userId: json['userId'] as String?,
        salesId: json['salesId'] as String?,
        salesName: json['salesName'] as String?,
        totalQuota: json['totalQuota'] as dynamic,
        deliveryBulkQuota: json['deliveryBulkQuota'] as dynamic,
        pickupBulkQuota: json['pickupBulkQuota'] as dynamic,
        totalBulkQuota: json['totalBulkQuota'] as dynamic,
        totalBulkPriority: json['totalBulkPriority'] as dynamic,
        deliveryBagsQuota: json['deliveryBagsQuota'] as dynamic,
        pickupBagsQuota: json['pickupBagsQuota'] as dynamic,
        totalBagsQuota: json['totalBagsQuota'] as dynamic,
        totalBagsPriority: json['totalBagsPriority'] as dynamic,
        pickupBulkPriority: json['pickupBulkPriority'] as dynamic,
        deliveryBulkPriority: json['deliveryBulkPriority'] as dynamic,
        pickupBagsPriority: json['pickupBagsPriority'] as dynamic,
        deliveryBagsPriority: json['deliveryBagsPriority'] as dynamic,
        extraBulkQuota: json['extraBulkQuota'] as dynamic,
        settelementBulkQuota: json['settelementBulkQuota'] as dynamic,
        extraBagsQuota: json['extraBagsQuota'] as dynamic,
        settelementBagsQuota: json['settelementBagsQuota'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'salesType': salesType,
        'userId': userId,
        'salesId': salesId,
        'salesName': salesName,
        'totalQuota': totalQuota,
        'deliveryBulkQuota': deliveryBulkQuota,
        'pickupBulkQuota': pickupBulkQuota,
        'totalBulkQuota': totalBulkQuota,
        'totalBulkPriority': totalBulkPriority,
        'deliveryBagsQuota': deliveryBagsQuota,
        'pickupBagsQuota': pickupBagsQuota,
        'totalBagsQuota': totalBagsQuota,
        'totalBagsPriority': totalBagsPriority,
        'pickupBulkPriority': pickupBulkPriority,
        'deliveryBulkPriority': deliveryBulkPriority,
        'pickupBagsPriority': pickupBagsPriority,
        'deliveryBagsPriority': deliveryBagsPriority,
        'extraBulkQuota': extraBulkQuota,
        'settelementBulkQuota': settelementBulkQuota,
        'extraBagsQuota': extraBagsQuota,
        'settelementBagsQuota': settelementBagsQuota,
      };

  @override
  List<Object?> get props => [
        id,
        salesType,
        userId,
        salesId,
        salesName,
        totalQuota,
        deliveryBulkQuota,
        pickupBulkQuota,
        totalBulkQuota,
        totalBulkPriority,
        deliveryBagsQuota,
        pickupBagsQuota,
        totalBagsQuota,
        totalBagsPriority,
        pickupBulkPriority,
        deliveryBulkPriority,
        pickupBagsPriority,
        deliveryBagsPriority,
        extraBulkQuota,
        settelementBulkQuota,
        extraBagsQuota,
        settelementBagsQuota,
      ];
}
