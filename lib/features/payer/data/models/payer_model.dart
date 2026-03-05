import 'package:equatable/equatable.dart';

class PayerModel extends Equatable {
  final String? id;
  final String? fullName;
  final String? customerStructureGroup;
  final String? countryCode;
  final String? countryDescription;
  final String? regionId;
  final String? regionName;
  final String? transportationZone;
  final String? transportationZoneDescription;
  final String? street;
  final String? taxAuthorityBranch;
  final String? customerGroup;
  final String? customerGroupDescription;
  final String? riskClass;
  final String? riskClassDescription;
  final String? nationalId;
  final String? registerNumber;
  final String? fileNumber;
  final String? division;
  final String? taxId;
  final String? validToDate;
  final String? telephone;
  final String? telephone2;
  final String? faxNumber;
  final String? email;
  final String? salesId;
  final String? salesName;
  final String? paymentType;
  final String? distributionChannel;
  final String? salesOrganization;
  final String? companyCode;
  final String? creditSegment;
  final String? creditSegmentDescription;
  final String? currency;
  final String? paymentTermDescription;
  final String? reconciliationAccount;
  final String? createdDate;
  final String? createdBy;
  final bool? isDeleted;
  final bool? isDeactivated;
  final bool? enablePickupility;
  final bool? enableAvaya;
  final bool? enablePricing;
  final dynamic passKey;

  const PayerModel({
    this.id,
    this.fullName,
    this.customerStructureGroup,
    this.countryCode,
    this.countryDescription,
    this.regionId,
    this.regionName,
    this.transportationZone,
    this.transportationZoneDescription,
    this.street,
    this.taxAuthorityBranch,
    this.customerGroup,
    this.customerGroupDescription,
    this.riskClass,
    this.riskClassDescription,
    this.nationalId,
    this.registerNumber,
    this.fileNumber,
    this.division,
    this.taxId,
    this.validToDate,
    this.telephone,
    this.telephone2,
    this.faxNumber,
    this.email,
    this.salesId,
    this.salesName,
    this.paymentType,
    this.distributionChannel,
    this.salesOrganization,
    this.companyCode,
    this.creditSegment,
    this.creditSegmentDescription,
    this.currency,
    this.paymentTermDescription,
    this.reconciliationAccount,
    this.createdDate,
    this.createdBy,
    this.isDeleted,
    this.isDeactivated,
    this.enablePickupility,
    this.enableAvaya,
    this.enablePricing,
    this.passKey,
  });

  factory PayerModel.fromJson(Map<String, dynamic> json) => PayerModel(
        id: json['id'] as String?,
        fullName: json['fullName'] as String?,
        customerStructureGroup: json['customerStructureGroup'] as String?,
        countryCode: json['countryCode'] as String?,
        countryDescription: json['countryDescription'] as String?,
        regionId: json['regionId'] as String?,
        regionName: json['regionName'] as String?,
        transportationZone: json['transportationZone'] as String?,
        transportationZoneDescription:
            json['transportationZoneDescription'] as String?,
        street: json['street'] as String?,
        taxAuthorityBranch: json['taxAuthorityBranch'] as String?,
        customerGroup: json['customerGroup'] as String?,
        customerGroupDescription: json['customerGroupDescription'] as String?,
        riskClass: json['riskClass'] as String?,
        riskClassDescription: json['riskClassDescription'] as String?,
        nationalId: json['nationalId'] as String?,
        registerNumber: json['registerNumber'] as String?,
        fileNumber: json['fileNumber'] as String?,
        division: json['division'] as String?,
        taxId: json['taxId'] as String?,
        validToDate: json['validToDate'] as String?,
        telephone: json['telephone'] as String?,
        telephone2: json['telephone2'] as String?,
        faxNumber: json['faxNumber'] as String?,
        email: json['email'] as String?,
        salesId: json['salesId'] as String?,
        salesName: json['salesName'] as String?,
        paymentType: json['paymentType'] as String?,
        distributionChannel: json['distributionChannel'] as String?,
        salesOrganization: json['salesOrganization'] as String?,
        companyCode: json['companyCode'] as String?,
        creditSegment: json['creditSegment'] as String?,
        creditSegmentDescription: json['creditSegmentDescription'] as String?,
        currency: json['currency'] as String?,
        paymentTermDescription: json['paymentTermDescription'] as String?,
        reconciliationAccount: json['reconciliationAccount'] as String?,
        createdDate: json['createdDate'] as String?,
        createdBy: json['createdBy'] as String?,
        isDeleted: json['isDeleted'] as bool?,
        isDeactivated: json['isDeactivated'] as bool?,
        enablePickupility: json['enablePickupility'] as bool?,
        enableAvaya: json['enableAvaya'] as bool?,
        enablePricing: json['enablePricing'] as bool?,
        passKey: json['passKey'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'customerStructureGroup': customerStructureGroup,
        'countryCode': countryCode,
        'countryDescription': countryDescription,
        'regionId': regionId,
        'regionName': regionName,
        'transportationZone': transportationZone,
        'transportationZoneDescription': transportationZoneDescription,
        'street': street,
        'taxAuthorityBranch': taxAuthorityBranch,
        'customerGroup': customerGroup,
        'customerGroupDescription': customerGroupDescription,
        'riskClass': riskClass,
        'riskClassDescription': riskClassDescription,
        'nationalId': nationalId,
        'registerNumber': registerNumber,
        'fileNumber': fileNumber,
        'division': division,
        'taxId': taxId,
        'validToDate': validToDate,
        'telephone': telephone,
        'telephone2': telephone2,
        'faxNumber': faxNumber,
        'email': email,
        'salesId': salesId,
        'salesName': salesName,
        'paymentType': paymentType,
        'distributionChannel': distributionChannel,
        'salesOrganization': salesOrganization,
        'companyCode': companyCode,
        'creditSegment': creditSegment,
        'creditSegmentDescription': creditSegmentDescription,
        'currency': currency,
        'paymentTermDescription': paymentTermDescription,
        'reconciliationAccount': reconciliationAccount,
        'createdDate': createdDate,
        'createdBy': createdBy,
        'isDeleted': isDeleted,
        'isDeactivated': isDeactivated,
        'enablePickupility': enablePickupility,
        'enableAvaya': enableAvaya,
        'enablePricing': enablePricing,
        'passKey': passKey,
      };

  @override
  List<Object?> get props {
    return [
      id,
      fullName,
      customerStructureGroup,
      countryCode,
      countryDescription,
      regionId,
      regionName,
      transportationZone,
      transportationZoneDescription,
      street,
      taxAuthorityBranch,
      customerGroup,
      customerGroupDescription,
      riskClass,
      riskClassDescription,
      nationalId,
      registerNumber,
      fileNumber,
      division,
      taxId,
      validToDate,
      telephone,
      telephone2,
      faxNumber,
      email,
      salesId,
      salesName,
      paymentType,
      distributionChannel,
      salesOrganization,
      companyCode,
      creditSegment,
      creditSegmentDescription,
      currency,
      paymentTermDescription,
      reconciliationAccount,
      createdDate,
      createdBy,
      isDeleted,
      isDeactivated,
      enablePickupility,
      enableAvaya,
      enablePricing,
      passKey,
    ];
  }
}
