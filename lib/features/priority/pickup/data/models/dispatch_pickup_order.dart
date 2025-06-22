import 'package:equatable/equatable.dart';

class DispatchPickupOrder extends Equatable {
  final String? id;
  final String? podNo;
  final String? podName;
  final String? podGovernment;
  final String? podCity;
  final String? podAddress;
  final String? podPhone;
  final double? quantity;
  final double? dispatchedQuantity;
  final String? dispatchChannel;
  final double? price;
  final String? payerId;
  final String? salesId;
  final dynamic salesUserId;
  final String? productId;
  final dynamic shipmentId;
  final String? salesName;
  final String? productName;
  final String? productCategory;
  final String? payerName;
  final String? payerRegionName;
  final int? status;
  final DateTime? priorityDate;
  final String? registerDate;
  final DateTime? dispatchDate;
  final dynamic leavingDate;
  final DateTime? createdAt;
  final DateTime? lastUpdatedAt;
  final int? truckNo;
  final String? createdBy;
  final bool? isDeleted;

  const DispatchPickupOrder({
    this.id,
    this.podNo,
    this.podName,
    this.podGovernment,
    this.podCity,
    this.podAddress,
    this.podPhone,
    this.quantity,
    this.dispatchedQuantity,
    this.dispatchChannel,
    this.price,
    this.payerId,
    this.salesId,
    this.salesUserId,
    this.productId,
    this.shipmentId,
    this.salesName,
    this.productName,
    this.productCategory,
    this.payerName,
    this.payerRegionName,
    this.status,
    this.priorityDate,
    this.registerDate,
    this.dispatchDate,
    this.leavingDate,
    this.createdAt,
    this.lastUpdatedAt,
    this.truckNo,
    this.createdBy,
    this.isDeleted,
  });

  factory DispatchPickupOrder.fromJson(Map<String, dynamic> json) {
    return DispatchPickupOrder(
      id: json['id'] as String?,
      podNo: json['podNo'] as String?,
      podName: json['podName'] as String?,
      podGovernment: json['podGovernment'] as String?,
      podCity: json['podCity'] as String?,
      podAddress: json['podAddress'] as String?,
      podPhone: json['podPhone'] as String?,
      quantity: json['quantity'] as double?,
      dispatchedQuantity: json['dispatchedQuantity'] as double?,
      dispatchChannel: json['dispatchChannel'] as String?,
      price: json['price'] as double?,
      payerId: json['payerId'] as String?,
      salesId: json['salesId'] as String?,
      salesUserId: json['salesUserId'] as dynamic,
      productId: json['productId'] as String?,
      shipmentId: json['shipmentId'] as dynamic,
      salesName: json['salesName'] as String?,
      productName: json['productName'] as String?,
      productCategory: json['productCategory'] as String?,
      payerName: json['payerName'] as String?,
      payerRegionName: json['payerRegionName'] as String?,
      status: json['status'] as int?,
      priorityDate: json['priorityDate'] == null
          ? null
          : DateTime.parse(json['priorityDate'] as String),
      registerDate: json['registerDate'] as String?,
      dispatchDate: json['dispatchDate'] == null
          ? null
          : DateTime.parse(json['dispatchDate'] as String),
      leavingDate: json['leavingDate'] as dynamic,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastUpdatedAt: json['lastUpdatedAt'] == null
          ? null
          : DateTime.parse(json['lastUpdatedAt'] as String),
      truckNo: json['truckNo'] as int?,
      createdBy: json['createdBy'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'podNo': podNo,
        'podName': podName,
        'podGovernment': podGovernment,
        'podCity': podCity,
        'podAddress': podAddress,
        'podPhone': podPhone,
        'quantity': quantity,
        'dispatchedQuantity': dispatchedQuantity,
        'dispatchChannel': dispatchChannel,
        'price': price,
        'payerId': payerId,
        'salesId': salesId,
        'salesUserId': salesUserId,
        'productId': productId,
        'shipmentId': shipmentId,
        'salesName': salesName,
        'productName': productName,
        'productCategory': productCategory,
        'payerName': payerName,
        'payerRegionName': payerRegionName,
        'status': status,
        'priorityDate': priorityDate?.toIso8601String(),
        'registerDate': registerDate,
        'dispatchDate': dispatchDate?.toIso8601String(),
        'leavingDate': leavingDate,
        'createdAt': createdAt?.toIso8601String(),
        'lastUpdatedAt': lastUpdatedAt?.toIso8601String(),
        'truckNo': truckNo,
        'createdBy': createdBy,
        'isDeleted': isDeleted,
      };

  @override
  List<Object?> get props {
    return [
      id,
      podNo,
      podName,
      podGovernment,
      podCity,
      podAddress,
      podPhone,
      quantity,
      dispatchedQuantity,
      dispatchChannel,
      price,
      payerId,
      salesId,
      salesUserId,
      productId,
      shipmentId,
      salesName,
      productName,
      productCategory,
      payerName,
      payerRegionName,
      status,
      priorityDate,
      registerDate,
      dispatchDate,
      leavingDate,
      createdAt,
      lastUpdatedAt,
      truckNo,
      createdBy,
      isDeleted,
    ];
  }
}
