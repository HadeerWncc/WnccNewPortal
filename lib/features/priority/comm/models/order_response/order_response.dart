import 'package:equatable/equatable.dart';

import 'payer.dart';
import 'product.dart';
import 'sales.dart';
import 'updated_by.dart';

class OrderResponse extends Equatable {
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
  final Payer? payer;
  final Sales? sales;
  final Product? product;
  final dynamic shipmentId;
  final dynamic dispatchAgent;
  final int? status;
  final DateTime? priorityDate;
  final DateTime? registerDate;
  final DateTime? dispatchDate;
  final DateTime? leavingDate;
  final DateTime? updatedAt;
  final int? truckNo;
  final bool? isDeleted;
  final bool? isDeactivated;
  final UpdatedBy? updatedBy;

  const OrderResponse({
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
    this.payer,
    this.sales,
    this.product,
    this.shipmentId,
    this.dispatchAgent,
    this.status,
    this.priorityDate,
    this.registerDate,
    this.dispatchDate,
    this.leavingDate,
    this.updatedAt,
    this.truckNo,
    this.isDeleted,
    this.isDeactivated,
    this.updatedBy,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
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
        payer: json['payer'] == null
            ? null
            : Payer.fromJson(json['payer'] as Map<String, dynamic>),
        sales: json['sales'] == null
            ? null
            : Sales.fromJson(json['sales'] as Map<String, dynamic>),
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
        shipmentId: json['shipmentId'] as dynamic,
        dispatchAgent: json['dispatchAgent'] as dynamic,
        status: json['status'] as int?,
        priorityDate: json['priorityDate'] == null
            ? null
            : DateTime.parse(json['priorityDate'] as String),
        registerDate: json['registerDate'] == null
            ? null
            : DateTime.parse(json['registerDate'] as String),
        dispatchDate: json['dispatchDate'] == null
            ? null
            : DateTime.parse(json['dispatchDate'] as String),
        leavingDate: json['leavingDate'] == null
            ? null
            : DateTime.parse(json['leavingDate'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        truckNo: json['truckNo'] as int?,
        isDeleted: json['isDeleted'] as bool?,
        isDeactivated: json['isDeactivated'] as bool?,
        updatedBy: json['updatedBy'] == null
            ? null
            : UpdatedBy.fromJson(json['updatedBy'] as Map<String, dynamic>),
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
        'dispatchedQuantity': dispatchedQuantity,
        'dispatchChannel': dispatchChannel,
        'price': price,
        'payer': payer?.toJson(),
        'sales': sales?.toJson(),
        'product': product?.toJson(),
        'shipmentId': shipmentId,
        'dispatchAgent': dispatchAgent,
        'status': status,
        'priorityDate': priorityDate,
        'registerDate': registerDate?.toIso8601String(),
        'dispatchDate': dispatchDate,
        'leavingDate': leavingDate,
        'updatedAt': updatedAt?.toIso8601String(),
        'truckNo': truckNo,
        'isDeleted': isDeleted,
        'isDeactivated': isDeactivated,
        'updatedBy': updatedBy?.toJson(),
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
      payer,
      sales,
      product,
      shipmentId,
      dispatchAgent,
      status,
      priorityDate,
      registerDate,
      dispatchDate,
      leavingDate,
      updatedAt,
      truckNo,
      isDeleted,
      isDeactivated,
      updatedBy,
    ];
  }
}
