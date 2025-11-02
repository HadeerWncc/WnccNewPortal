import 'package:equatable/equatable.dart';

class PayerModel extends Equatable {
  final String? id;
  final String? fullName;
  final String? email;
  final String? address;
  final String? country;
  final String? religion;
  final String? payerModelClass;
  final String? faxNumber;
  final String? taxNumber;
  final String? transportZone;
  final String? taxZone;
  final String? taxFileNo;
  final String? license;
  final String? passKey;
  final int? payerType;
  final String? salesName;
  final String? salesId;
  final String? userId;
  final String? createdAt;
  final String? lastUpdatedAt;
  final String? createdBy;
  final String? lastUpdatedBy;
  final bool? isDeleted;
  final bool? enablePricing;
  final String? government;
  final String? regionId;
  final String? regionName;
  final dynamic phoneNumber;

  const PayerModel({
    this.id,
    this.fullName,
    this.email,
    this.address,
    this.country,
    this.religion,
    this.payerModelClass,
    this.faxNumber,
    this.taxNumber,
    this.transportZone,
    this.taxZone,
    this.taxFileNo,
    this.license,
    this.passKey,
    this.payerType,
    this.salesName,
    this.salesId,
    this.userId,
    this.createdAt,
    this.lastUpdatedAt,
    this.createdBy,
    this.lastUpdatedBy,
    this.isDeleted,
    this.enablePricing,
    this.government,
    this.regionId,
    this.regionName,
    this.phoneNumber,
  });

  factory PayerModel.fromJson(Map<String, dynamic> json) => PayerModel(
        id: json['id'] as String?,
        fullName: json['fullName'] as String?,
        email: json['email'] as String?,
        address: json['address'] as String?,
        country: json['country'] as String?,
        religion: json['religion'] as String?,
        payerModelClass: json['class'] as String?,
        faxNumber: json['faxNumber'] as String?,
        taxNumber: json['taxNumber'] as String?,
        transportZone: json['transportZone'] as String?,
        taxZone: json['taxZone'] as String?,
        taxFileNo: json['taxFileNo'] as String?,
        license: json['license'] as String?,
        passKey: json['passKey'] as String?,
        payerType: json['payerType'] as int?,
        salesName: json['salesName'] as String?,
        salesId: json['salesId'] as String?,
        userId: json['userId'] as String?,
        createdAt: json['createdAt'] as String?,
        lastUpdatedAt: json['lastUpdatedAt'] as String?,
        createdBy: json['createdBy'] as String?,
        lastUpdatedBy: json['lastUpdatedBy'] as String?,
        isDeleted: json['isDeleted'] as bool?,
        enablePricing: json['enablePricing'] as bool?,
        government: json['government'] as String?,
        regionId: json['regionId'] as String?,
        regionName: json['regionName'] as String?,
        phoneNumber: json['phoneNumber'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'email': email,
        'address': address,
        'country': country,
        'religion': religion,
        'class': payerModelClass,
        'faxNumber': faxNumber,
        'taxNumber': taxNumber,
        'transportZone': transportZone,
        'taxZone': taxZone,
        'taxFileNo': taxFileNo,
        'license': license,
        'passKey': passKey,
        'payerType': payerType,
        'salesName': salesName,
        'salesId': salesId,
        'userId': userId,
        'createdAt': createdAt,
        'lastUpdatedAt': lastUpdatedAt,
        'createdBy': createdBy,
        'lastUpdatedBy': lastUpdatedBy,
        'isDeleted': isDeleted,
        'enablePricing': enablePricing,
        'government': government,
        'regionId': regionId,
        'regionName': regionName,
        'phoneNumber': phoneNumber,
      };

  @override
  List<Object?> get props {
    return [
      id,
      fullName,
      email,
      address,
      country,
      religion,
      payerModelClass,
      faxNumber,
      taxNumber,
      transportZone,
      taxZone,
      taxFileNo,
      license,
      passKey,
      payerType,
      salesName,
      salesId,
      userId,
      createdAt,
      lastUpdatedAt,
      createdBy,
      lastUpdatedBy,
      isDeleted,
      enablePricing,
      government,
      regionId,
      regionName,
      phoneNumber,
    ];
  }
}
