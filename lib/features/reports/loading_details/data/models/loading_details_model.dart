import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class LoadingDetailsModel extends Equatable {
  final String? shipmentNo;
  final String? shipmentType;
  final String? customerId;
  final String? customerName;
  final dynamic branch;
  final String? branchName;
  final String? delivery;
  final num? deliveryQuantity;
  final String? materialId;
  final String? materialName;
  final dynamic materialDescription;
  final dynamic firstWeight;
  final dynamic secondWeight;
  final dynamic actualWeight;
  final dynamic incoterm;
  final String? incotermDescription;
  final dynamic driverName;
  final dynamic truck;
  final dynamic trailer;
  final dynamic serviceAgent;
  final dynamic serviceAgentName;
  final String? planningDate;
  final String? planningTime;
  final String? checkInDate;
  final String? checkInTime;
  final dynamic loadStartDate;
  final String? loadStartTime;
  final dynamic loadEndDate;
  final String? loadEndTime;
  final dynamic completionDate;
  final dynamic completionTime;
  final dynamic confirmationDate;
  final dynamic confirmationStatus;
  final dynamic acGiDate;
  final dynamic deliveryCreatedOn;
  final dynamic deliveryTime;
  final dynamic shipmentCreatedOn;
  final dynamic shipmentTime;
  final dynamic plant;
  final dynamic plantDesc;
  final int? dChl;
  final String? distributionChannel;
  final dynamic shippingPoint;
  final dynamic shippingPointDescription;
  final String? salesId;
  final String? salesName;
  final dynamic unitPrice;
  final dynamic currency;
  final dynamic bagType;
  final dynamic bagTypeDescription;
  final dynamic packgingType;
  final dynamic original;
  final dynamic qty;
  final int? month;
  final dynamic year;

  const LoadingDetailsModel({
    this.shipmentNo,
    this.shipmentType,
    this.customerId,
    this.customerName,
    this.branch,
    this.branchName,
    this.delivery,
    this.deliveryQuantity,
    this.materialId,
    this.materialName,
    this.materialDescription,
    this.firstWeight,
    this.secondWeight,
    this.actualWeight,
    this.incoterm,
    this.incotermDescription,
    this.driverName,
    this.truck,
    this.trailer,
    this.serviceAgent,
    this.serviceAgentName,
    this.planningDate,
    this.planningTime,
    this.checkInDate,
    this.checkInTime,
    this.loadStartDate,
    this.loadStartTime,
    this.loadEndDate,
    this.loadEndTime,
    this.completionDate,
    this.completionTime,
    this.confirmationDate,
    this.confirmationStatus,
    this.acGiDate,
    this.deliveryCreatedOn,
    this.deliveryTime,
    this.shipmentCreatedOn,
    this.shipmentTime,
    this.plant,
    this.plantDesc,
    this.dChl,
    this.distributionChannel,
    this.shippingPoint,
    this.shippingPointDescription,
    this.salesId,
    this.salesName,
    this.unitPrice,
    this.currency,
    this.bagType,
    this.bagTypeDescription,
    this.packgingType,
    this.original,
    this.qty,
    this.month,
    this.year,
  });

  factory LoadingDetailsModel.fromJson(Map<String, dynamic> json) {
    return LoadingDetailsModel(
      shipmentNo: json['shipmentNo'] as String?,
      shipmentType: json['shipmentType'] as String?,
      customerId: json['customerId'] as String?,
      customerName: json['customerName'] as String?,
      branch: json['branch'] as dynamic,
      branchName: json['branchName'] as String?,
      delivery: json['delivery'] as String?,
      deliveryQuantity: json['deliveryQuantity'] as num?,
      materialId: json['materialId'] as String?,
      materialName: json['materialName'] as String?,
      materialDescription: json['materialDescription'] as dynamic,
      firstWeight: json['firstWeight'] as dynamic,
      secondWeight: json['secondWeight'] as dynamic,
      actualWeight: json['actualWeight'] as dynamic,
      incoterm: json['incoterm'] as dynamic,
      incotermDescription: json['incotermDescription'] as String?,
      driverName: json['driverName'] as dynamic,
      truck: json['truck'] as dynamic,
      trailer: json['trailer'] as dynamic,
      serviceAgent: json['serviceAgent'] as dynamic,
      serviceAgentName: json['serviceAgentName'] as dynamic,
      planningDate: json['planningDate'] as String?,
      planningTime: json['planningTime'] as String?,
      checkInDate: json['checkInDate'] as String?,
      checkInTime: json['checkInTime'] as String?,
      loadStartDate: json['loadStartDate'] as dynamic,
      loadStartTime: json['loadStartTime'] as String?,
      loadEndDate: json['loadEndDate'] as dynamic,
      loadEndTime: json['loadEndTime'] as String?,
      completionDate: json['completionDate'] as dynamic,
      completionTime: json['completionTime'] as dynamic,
      confirmationDate: json['confirmationDate'] as dynamic,
      confirmationStatus: json['confirmationStatus'] as dynamic,
      acGiDate: json['acGIDate'] as dynamic,
      deliveryCreatedOn: json['deliveryCreatedOn'] as dynamic,
      deliveryTime: json['deliveryTime'] as dynamic,
      shipmentCreatedOn: json['shipmentCreatedOn'] as dynamic,
      shipmentTime: json['shipmentTime'] as dynamic,
      plant: json['plant'] as dynamic,
      plantDesc: json['plantDesc'] as dynamic,
      dChl: json['dChl'] as int?,
      distributionChannel: json['distributionChannel'] as String?,
      shippingPoint: json['shippingPoint'] as dynamic,
      shippingPointDescription: json['shippingPointDescription'] as dynamic,
      salesId: json['salesId'] as String?,
      salesName: json['salesName'] as String?,
      unitPrice: json['unitPrice'] as dynamic,
      currency: json['currency'] as dynamic,
      bagType: json['bagType'] as dynamic,
      bagTypeDescription: json['bagTypeDescription'] as dynamic,
      packgingType: json['packgingType'] as dynamic,
      original: json['original'] as dynamic,
      qty: json['qty'] as dynamic,
      month: json['month'] as int?,
      year: json['year'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'shipmentNo': shipmentNo,
        'shipmentType': shipmentType,
        'customerId': customerId,
        'customerName': customerName,
        'branch': branch,
        'branchName': branchName,
        'delivery': delivery,
        'deliveryQuantity': deliveryQuantity,
        'materialId': materialId,
        'materialName': materialName,
        'materialDescription': materialDescription,
        'firstWeight': firstWeight,
        'secondWeight': secondWeight,
        'actualWeight': actualWeight,
        'incoterm': incoterm,
        'incotermDescription': incotermDescription,
        'driverName': driverName,
        'truck': truck,
        'trailer': trailer,
        'serviceAgent': serviceAgent,
        'serviceAgentName': serviceAgentName,
        'planningDate': planningDate,
        'planningTime': planningTime,
        'checkInDate': checkInDate,
        'checkInTime': checkInTime,
        'loadStartDate': loadStartDate,
        'loadStartTime': loadStartTime,
        'loadEndDate': loadEndDate,
        'loadEndTime': loadEndTime,
        'completionDate': completionDate,
        'completionTime': completionTime,
        'confirmationDate': confirmationDate,
        'confirmationStatus': confirmationStatus,
        'acGIDate': acGiDate,
        'deliveryCreatedOn': deliveryCreatedOn,
        'deliveryTime': deliveryTime,
        'shipmentCreatedOn': shipmentCreatedOn,
        'shipmentTime': shipmentTime,
        'plant': plant,
        'plantDesc': plantDesc,
        'dChl': dChl,
        'distributionChannel': distributionChannel,
        'shippingPoint': shippingPoint,
        'shippingPointDescription': shippingPointDescription,
        'salesId': salesId,
        'salesName': salesName,
        'unitPrice': unitPrice,
        'currency': currency,
        'bagType': bagType,
        'bagTypeDescription': bagTypeDescription,
        'packgingType': packgingType,
        'original': original,
        'qty': qty,
        'month': month,
        'year': year,
      };

  Map<String, dynamic> toMap() => {
        'Customer': customerId,
        'Customer Name': customerName,
        'Branch': branchName,
        'Shipment Type': shipmentType,
        'Status': loadStartDate == null ? 'Check In' : 'Loading',
        'Product': materialName,
        'Quantity': deliveryQuantity,
        'CheckIn Date':
            '${DateFormat('d/m/yyyy').format(DateTime.parse(checkInDate!))} ${DateFormat('hh:mm:ss').format(DateTime.parse(checkInTime!))}',
        'loading Date': loadStartDate == null
            ? ''
            : '${DateFormat('d/m/yyyy').format(DateTime.parse(loadStartDate))} ${DateFormat('hh:mm:ss').format(DateTime.parse(loadStartTime!))}',
        'Shipment No': shipmentNo ?? '-',
        'Sales Name': salesName ?? '-',
      };

  @override
  List<Object?> get props {
    return [
      shipmentNo,
      shipmentType,
      customerId,
      customerName,
      branch,
      branchName,
      delivery,
      deliveryQuantity,
      materialId,
      materialName,
      materialDescription,
      firstWeight,
      secondWeight,
      actualWeight,
      incoterm,
      incotermDescription,
      driverName,
      truck,
      trailer,
      serviceAgent,
      serviceAgentName,
      planningDate,
      planningTime,
      checkInDate,
      checkInTime,
      loadStartDate,
      loadStartTime,
      loadEndDate,
      loadEndTime,
      completionDate,
      completionTime,
      confirmationDate,
      confirmationStatus,
      acGiDate,
      deliveryCreatedOn,
      deliveryTime,
      shipmentCreatedOn,
      shipmentTime,
      plant,
      plantDesc,
      dChl,
      distributionChannel,
      shippingPoint,
      shippingPointDescription,
      salesId,
      salesName,
      unitPrice,
      currency,
      bagType,
      bagTypeDescription,
      packgingType,
      original,
      qty,
      month,
      year,
    ];
  }
}
