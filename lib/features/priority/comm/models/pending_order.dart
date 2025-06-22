import 'package:equatable/equatable.dart';

class PendingOrder extends Equatable {
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
  final DateTime? registerDate;
  final String? createdAt;
  final String? lastUpdatedAt;
  final String? createdBy;
  final bool? isDeleted;

  const PendingOrder({
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
    this.registerDate,
    this.createdAt,
    this.lastUpdatedAt,
    this.createdBy,
    this.isDeleted,
  });

  factory PendingOrder.fromJson(Map<String, dynamic> json) => PendingOrder(
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
        registerDate: DateTime.parse(json['registerDate']) as DateTime?,
        createdAt: json['createdAt'] as String?,
        lastUpdatedAt: json['lastUpdatedAt'] as String?,
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
        'registerDate': registerDate,
        'createdAt': createdAt,
        'lastUpdatedAt': lastUpdatedAt,
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
      registerDate,
      createdAt,
      lastUpdatedAt,
      createdBy,
      isDeleted,
    ];
  }
}
