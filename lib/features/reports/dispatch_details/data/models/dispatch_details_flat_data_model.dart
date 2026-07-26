import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class DispatchDetailsFlatDataModel extends Equatable {
  final String? shipmentNo;
  final String? customerId;
  final String? customerName;
  final String? customerRegionId;
  final String? customerRegion;
  final String? structureGroup;
  final String? branchName;
  final String? branchRegion;
  final String? branchRegionDesc;
  final dynamic branchTranspZoneDesc;
  final String? delivery;
  final num? deliveryQuantity;
  final String? unitPrice;
  final dynamic currency;
  final String? materialId;
  final String? materialName;
  final dynamic materialDescription;
  final dynamic incoterm;
  final String? incotermDesc;
  final dynamic receiver;
  final String? receiverRegion;
  final String? receiverRegionDesc;
  final dynamic receiverTransportationZone;
  final dynamic receiverTransZoneDesc;
  final dynamic receiverStreet;
  final dynamic receiverTelephone;
  final String? receiverStructureGroup;
  final String? salesId;
  final String? salesName;
  final String? truck;
  final String? trailer;
  final int? month;
  final String? distributionChannel;
  final String? acGiDate;

  const DispatchDetailsFlatDataModel({
    this.shipmentNo,
    this.customerId,
    this.customerName,
    this.customerRegionId,
    this.customerRegion,
    this.structureGroup,
    this.branchName,
    this.branchRegion,
    this.branchRegionDesc,
    this.branchTranspZoneDesc,
    this.delivery,
    this.deliveryQuantity,
    this.unitPrice,
    this.currency,
    this.materialId,
    this.materialName,
    this.materialDescription,
    this.incoterm,
    this.incotermDesc,
    this.receiver,
    this.receiverRegion,
    this.receiverRegionDesc,
    this.receiverTransportationZone,
    this.receiverTransZoneDesc,
    this.receiverStreet,
    this.receiverTelephone,
    this.receiverStructureGroup,
    this.salesId,
    this.salesName,
    this.truck,
    this.trailer,
    this.month,
    this.distributionChannel,
    this.acGiDate,
  });

  factory DispatchDetailsFlatDataModel.fromJson(Map<String, dynamic> json) {
    return DispatchDetailsFlatDataModel(
      shipmentNo: json['shipmentNo'] as String?,
      customerId: json['customerId'] as String?,
      customerName: json['customerName'] as String?,
      customerRegionId: json['customerRegionId'] as String?,
      customerRegion: json['customerRegion'] as String?,
      structureGroup: json['structureGroup'] as String?,
      branchName: json['branchName'] as String?,
      branchRegion: json['branchRegion'] as String?,
      branchRegionDesc: json['branchRegionDesc'] as String?,
      branchTranspZoneDesc: json['branchTranspZoneDesc'] as dynamic,
      delivery: json['delivery'] as String?,
      deliveryQuantity: json['deliveryQuantity'] as num?,
      unitPrice: json['unitPrice'] as String?,
      currency: json['currency'] as dynamic,
      materialId: json['materialId'] as String?,
      materialName: json['materialName'] as String?,
      materialDescription: json['materialDescription'] as dynamic,
      incoterm: json['incoterm'] as dynamic,
      incotermDesc: json['incotermDesc'] as String?,
      receiver: json['receiver'] as dynamic,
      receiverRegion: json['receiverRegion'] as String?,
      receiverRegionDesc: json['receiverRegionDesc'] as String?,
      receiverTransportationZone: json['receiverTransportationZone'] as dynamic,
      receiverTransZoneDesc: json['receiverTransZoneDesc'] as dynamic,
      receiverStreet: json['receiverStreet'] as dynamic,
      receiverTelephone: json['receiverTelephone'] as dynamic,
      receiverStructureGroup: json['receiverStructureGroup'] as String?,
      salesId: json['salesId'] as String?,
      salesName: json['salesName'] as String?,
      truck: json['truck'] as String?,
      trailer: json['trailer'] as String?,
      month: json['month'] as int?,
      distributionChannel: json['distributionChannel'] as String?,
      acGiDate: json['acGIDate'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'Code': int.parse(customerId ?? ''),
        'Customer': customerName,
        'Customer Region': customerRegion,
        'QTY': deliveryQuantity!.toInt(),
        'Material': materialName,
        'Incoterm': incotermDesc,
        'Receiver Region': receiverRegionDesc,
        'Receiver Area': receiverStructureGroup,
        'Date': DateFormat('d/M/yyyy').format(DateTime.parse(acGiDate ?? '')),
        'Channel': distributionChannel,
        'Sales': salesName,
        'Month': month,
        'Ship.No': shipmentNo,
        'Truck': truck,
        'Trailer': trailer,
      };

  @override
  List<Object?> get props {
    return [
      shipmentNo,
      customerId,
      customerName,
      customerRegionId,
      customerRegion,
      structureGroup,
      branchName,
      branchRegion,
      branchRegionDesc,
      branchTranspZoneDesc,
      delivery,
      deliveryQuantity,
      unitPrice,
      currency,
      materialId,
      materialName,
      materialDescription,
      incoterm,
      incotermDesc,
      receiver,
      receiverRegion,
      receiverRegionDesc,
      receiverTransportationZone,
      receiverTransZoneDesc,
      receiverStreet,
      receiverTelephone,
      receiverStructureGroup,
      salesId,
      salesName,
      truck,
      trailer,
      month,
      distributionChannel,
      acGiDate,
    ];
  }
}
