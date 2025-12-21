import 'package:equatable/equatable.dart';

class Sales extends Equatable {
  final String? salesId;
  final String? region;
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? url;

  const Sales({
    this.salesId,
    this.region,
    this.id,
    this.fullName,
    this.phoneNumber,
    this.url,
  });

  factory Sales.fromJson(Map<String, dynamic> json) => Sales(
        salesId: json['salesId'] as String?,
        region: json['region'] as String?,
        id: json['id'] as String?,
        fullName: json['fullName'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'salesId': salesId,
        'region': region,
        'id': id,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'url': url,
      };

  @override
  List<Object?> get props {
    return [
      salesId,
      region,
      id,
      fullName,
      phoneNumber,
      url,
    ];
  }
}
