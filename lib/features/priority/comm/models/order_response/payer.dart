import 'package:equatable/equatable.dart';

class Payer extends Equatable {
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final String? region;

  const Payer({this.id, this.fullName, this.phoneNumber, this.region});

  factory Payer.fromJson(Map<String, dynamic> json) => Payer(
        id: json['id'] as String?,
        fullName: json['fullName'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        region: json['region'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'region': region,
      };

  @override
  List<Object?> get props => [id, fullName, phoneNumber, region];
}
