import 'package:equatable/equatable.dart';

class PendingModel extends Equatable {
  final String? customerId;
  final String? customerName;
  final String? country;
  final String? customerRegionId;
  final String? customerRegionDescription;
  final String? branch;
  final String? branchName;
  final String? rg;
  final String? branchRegionDescription;
  final String? branchTransportationZone;
  final String? branchTransZoneDesc;
  final String? salesDocument;
  final String? delivery;
  final num? deliveryQuantity;
  final num? unitPrice;
  final String? currency;
  final String? materialId;
  final String? materialDescription;
  final String? materialName;
  final String? incoterm;
  final String? incotermDescription;
  final String? receiver;
  final String? receiverStreet;
  final String? addressTransZoneDesc;
  final String? addressTransportationZone;
  final String? structureGroup;
  final String? telephone;
  final String? salesId;
  final String? salesName;
  final String? distributionChannel;
  final String? distributionChannelDuplicate;
  final String? goodsMovementStatus;
  final dynamic dispatcher;
  final String? status;
  final dynamic priorityDate;
  final String? registerDate;
  final dynamic dispatchDate;
  final dynamic completionDate;
  final int? truckNo;
  final bool? isDeleted;
  final bool? isDeactivated;

  const PendingModel({
    this.customerId,
    this.customerName,
    this.country,
    this.customerRegionId,
    this.customerRegionDescription,
    this.branch,
    this.branchName,
    this.rg,
    this.branchRegionDescription,
    this.branchTransportationZone,
    this.branchTransZoneDesc,
    this.salesDocument,
    this.delivery,
    this.deliveryQuantity,
    this.unitPrice,
    this.currency,
    this.materialId,
    this.materialDescription,
    this.materialName,
    this.incoterm,
    this.incotermDescription,
    this.receiver,
    this.receiverStreet,
    this.addressTransZoneDesc,
    this.addressTransportationZone,
    this.structureGroup,
    this.telephone,
    this.salesId,
    this.salesName,
    this.distributionChannel,
    this.distributionChannelDuplicate,
    this.goodsMovementStatus,
    this.dispatcher,
    this.status,
    this.priorityDate,
    this.registerDate,
    this.dispatchDate,
    this.completionDate,
    this.truckNo,
    this.isDeleted,
    this.isDeactivated,
  });

  factory PendingModel.fromJson(Map<String, dynamic> json) => PendingModel(
        customerId: json['customerId'] as String?,
        customerName: json['customerName'] as String?,
        country: json['country'] as String?,
        customerRegionId: json['customerRegionId'] as String?,
        customerRegionDescription: json['customerRegionDescription'] as String?,
        branch: json['branch'] as String?,
        branchName: json['branchName'] as String?,
        rg: json['rg'] as String?,
        branchRegionDescription: json['branchRegionDescription'] as String?,
        branchTransportationZone: json['branchTransportationZone'] as String?,
        branchTransZoneDesc: json['branchTransZoneDesc'] as String?,
        salesDocument: json['salesDocument'] as String?,
        delivery: json['delivery'] as String?,
        deliveryQuantity: json['deliveryQuantity'] as num?,
        unitPrice: json['unitPrice'] as num?,
        currency: json['currency'] as String?,
        materialId: json['materialId'] as String?,
        materialDescription: json['materialDescription'] as String?,
        materialName: json['materialName'] as String?,
        incoterm: json['incoterm'] as String?,
        incotermDescription: json['incotermDescription'] as String?,
        receiver: json['receiver'] as String?,
        receiverStreet: json['receiverStreet'] as String?,
        addressTransZoneDesc: json['addressTransZoneDesc'] as String?,
        addressTransportationZone: json['addressTransportationZone'] as String?,
        structureGroup: json['structureGroup'] as String?,
        telephone: json['telephone'] as String?,
        salesId: json['salesId'] as String?,
        salesName: json['salesName'] as String?,
        distributionChannel: json['distributionChannel'] as String?,
        distributionChannelDuplicate:
            json['distributionChannelDuplicate'] as String?,
        goodsMovementStatus: json['goodsMovementStatus'] as String?,
        dispatcher: json['dispatcher'] as dynamic,
        status: json['status'] as String?,
        priorityDate: json['priorityDate'] as dynamic,
        registerDate: json['registerDate'] as String?,
        dispatchDate: json['dispatchDate'] as dynamic,
        completionDate: json['completionDate'] as dynamic,
        truckNo: json['truckNo'] as int?,
        isDeleted: json['isDeleted'] as bool?,
        isDeactivated: json['isDeactivated'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'customerId': customerId,
        'customerName': customerName,
        'country': country,
        'customerRegionId': customerRegionId,
        'customerRegionDescription': customerRegionDescription,
        'branch': branch,
        'branchName': branchName,
        'rg': rg,
        'branchRegionDescription': branchRegionDescription,
        'branchTransportationZone': branchTransportationZone,
        'branchTransZoneDesc': branchTransZoneDesc,
        'salesDocument': salesDocument,
        'delivery': delivery,
        'deliveryQuantity': deliveryQuantity,
        'unitPrice': unitPrice,
        'currency': currency,
        'materialId': materialId,
        'materialDescription': materialDescription,
        'materialName': materialName,
        'incoterm': incoterm,
        'incotermDescription': incotermDescription,
        'receiver': receiver,
        'receiverStreet': receiverStreet,
        'addressTransZoneDesc': addressTransZoneDesc,
        'addressTransportationZone': addressTransportationZone,
        'structureGroup': structureGroup,
        'telephone': telephone,
        'salesId': salesId,
        'salesName': salesName,
        'distributionChannel': distributionChannel,
        'distributionChannelDuplicate': distributionChannelDuplicate,
        'goodsMovementStatus': goodsMovementStatus,
        'dispatcher': dispatcher,
        'status': status,
        'priorityDate': priorityDate,
        'registerDate': registerDate,
        'dispatchDate': dispatchDate,
        'completionDate': completionDate,
        'truckNo': truckNo,
        'isDeleted': isDeleted,
        'isDeactivated': isDeactivated,
      };

  Map<String, dynamic> toMap() => {
        'Customer': customerId,
        'Customer Name': customerName,
        'Order No': delivery,
        'Product': materialName,
        'Quantity': deliveryQuantity,
        'Region': branchName,
        'City': country,
        'Sales': salesName,
        'Date': registerDate,
      };

  @override
  List<Object?> get props {
    return [
      customerId,
      customerName,
      country,
      customerRegionId,
      customerRegionDescription,
      branch,
      branchName,
      rg,
      branchRegionDescription,
      branchTransportationZone,
      branchTransZoneDesc,
      salesDocument,
      delivery,
      deliveryQuantity,
      unitPrice,
      currency,
      materialId,
      materialDescription,
      materialName,
      incoterm,
      incotermDescription,
      receiver,
      receiverStreet,
      addressTransZoneDesc,
      addressTransportationZone,
      structureGroup,
      telephone,
      salesId,
      salesName,
      distributionChannel,
      distributionChannelDuplicate,
      goodsMovementStatus,
      dispatcher,
      status,
      priorityDate,
      registerDate,
      dispatchDate,
      completionDate,
      truckNo,
      isDeleted,
      isDeactivated,
    ];
  }
}
