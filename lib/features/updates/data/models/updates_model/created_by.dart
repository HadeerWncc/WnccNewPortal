import 'package:equatable/equatable.dart';

class CreatedBy extends Equatable {
  final String? id;
  final dynamic profileId;
  final String? fullName;
  final String? phoneNumber;
  final dynamic url;

  const CreatedBy({
    this.id,
    this.profileId,
    this.fullName,
    this.phoneNumber,
    this.url,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json['id'] as String?,
        profileId: json['profileId'] as dynamic,
        fullName: json['fullName'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        url: json['url'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'profileId': profileId,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'url': url,
      };

  @override
  List<Object?> get props => [id, profileId, fullName, phoneNumber, url];
}
