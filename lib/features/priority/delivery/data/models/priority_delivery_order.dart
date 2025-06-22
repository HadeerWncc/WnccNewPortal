import 'package:equatable/equatable.dart';

class PriorityDeliveryOrder extends Equatable {
  final String? id;
  final String? podNo;
  final String? podName;
  final String? podGovernment;
  final String? podCity;
  final String? podAddress;
  final String? podPhone;
  final double? quantity;
  final String? dispatchChannel;
  final double? price;
  final String? payerId;
  final String? salesId;
  final String? salesUserId;
  final String? productId;
  final String? salesName;
  final String? productName;
  final String? productCategory;
  final String? payerName;
  final String? payerRegionName;
  final int? status;
  final DateTime? priorityDate;
  final DateTime? createdAt;
  final DateTime? lastUpdatedAt;
  final String? registerDate;
  final int? truckNo;
  final String? createdBy;
  final bool? isDeleted;

  const PriorityDeliveryOrder({
    this.id,
    this.podNo,
    this.podName,
    this.podGovernment,
    this.podCity,
    this.podAddress,
    this.podPhone,
    this.quantity,
    this.dispatchChannel,
    this.price,
    this.payerId,
    this.salesId,
    this.salesUserId,
    this.productId,
    this.salesName,
    this.productName,
    this.productCategory,
    this.payerName,
    this.payerRegionName,
    this.status,
    this.priorityDate,
    this.createdAt,
    this.lastUpdatedAt,
    this.registerDate,
    this.truckNo,
    this.createdBy,
    this.isDeleted,
  });

  factory PriorityDeliveryOrder.fromJson(Map<String, dynamic> json) =>
      PriorityDeliveryOrder(
        id: json['id'] as String?,
        podNo: json['podNo'] as String?,
        podName: json['podName'] as String?,
        podGovernment: json['podGovernment'] as String?,
        podCity: json['podCity'] as String?,
        podAddress: json['podAddress'] as String?,
        podPhone: json['podPhone'] as String?,
        quantity: json['quantity'] as double?,
        dispatchChannel: json['dispatchChannel'] as String?,
        price: json['price'] as double?,
        payerId: json['payerId'] as String?,
        salesId: json['salesId'] as String?,
        salesUserId: json['salesUserId'] as String?,
        productId: json['productId'] as String?,
        salesName: json['salesName'] as String?,
        productName: json['productName'] as String?,
        productCategory: json['productCategory'] as String?,
        payerName: json['payerName'] as String?,
        payerRegionName: json['payerRegionName'] as String?,
        status: json['status'] as int?,
        priorityDate: json['priorityDate'] == null
            ? null
            : DateTime.parse(json['priorityDate'] as String),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        lastUpdatedAt: json['lastUpdatedAt'] == null
            ? null
            : DateTime.parse(json['lastUpdatedAt'] as String),
        registerDate: json['registerDate'] as String?,
        truckNo: json['truckNo'] as int?,
        createdBy: json['createdBy'] as String?,
        isDeleted: json['isDeleted'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'podNo': podNo,
        'podName': podName,
        'podGovernment': podGovernment,
        'podCity': podCity,
        'podAddress': podAddress,
        'podPhone': podPhone,
        'quantity': quantity,
        'dispatchChannel': dispatchChannel,
        'price': price,
        'payerId': payerId,
        'salesId': salesId,
        'salesUserId': salesUserId,
        'productId': productId,
        'salesName': salesName,
        'productName': productName,
        'productCategory': productCategory,
        'payerName': payerName,
        'payerRegionName': payerRegionName,
        'status': status,
        'priorityDate': priorityDate?.toIso8601String(),
        'createdAt': createdAt?.toIso8601String(),
        'lastUpdatedAt': lastUpdatedAt?.toIso8601String(),
        'registerDate': registerDate,
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
      dispatchChannel,
      price,
      payerId,
      salesId,
      salesUserId,
      productId,
      salesName,
      productName,
      productCategory,
      payerName,
      payerRegionName,
      status,
      priorityDate,
      createdAt,
      lastUpdatedAt,
      registerDate,
      truckNo,
      createdBy,
      isDeleted,
    ];
  }
}
