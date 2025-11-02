class AddPayerEntity {
  final String id;
  final String fullName;
  final String email;
  final String country;
  final String address;
  final String government;
  final String transportZone;
  final String religion;
  final String classification;
  final String license;
  final String faxNumber;
  final String taxNumber;
  final String taxZone;
  final String taxFileNo;
  final String passKey;
  final String payerType;
  final String regionId;
  final String salesId;
  final String phone;

  AddPayerEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.country,
    required this.address,
    required this.government,
    required this.transportZone,
    required this.religion,
    required this.classification,
    required this.license,
    required this.faxNumber,
    required this.taxNumber,
    required this.taxZone,
    required this.taxFileNo,
    required this.passKey,
    required this.payerType,
    required this.regionId,
    required this.salesId,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "country": country,
        "address": address,
        "government": government,
        "transportZone": transportZone,
        "religion": religion,
        "class": classification,
        "license": license,
        "faxNumber": faxNumber,
        "taxNumber": taxNumber,
        "taxZone": taxZone,
        "taxFileNo": taxFileNo,
        "passKey": passKey,
        "payerType": payerType,
        "regionId": regionId,
        "salesId": salesId,
        "phone": phone,
      };

  // @override
  // List<Object?> get props {
  //   return [
  //     id,
  //     fullName,
  //     email,
  //     country,
  //     address,
  //     government,
  //     transportZone,
  //     religion,
  //     classification,
  //     license,
  //     faxNumber,
  //     taxNumber,
  //     taxZone,
  //     taxFileNo,
  //     passKey,
  //     payerType,
  //     regionId,
  //     salesId,
  //     phone,
  //   ];
  // }
}
