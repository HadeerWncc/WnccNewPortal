import 'package:equatable/equatable.dart';

class ActionBy extends Equatable {
  final String? id;
  final String? profileId;
  final String? fullName;
  final String? phoneNumber;
  final String? url;

  const ActionBy({
    this.id,
    this.profileId,
    this.fullName,
    this.phoneNumber,
    this.url,
  });

  factory ActionBy.fromJson(Map<String, dynamic> json) => ActionBy(
        id: json['id'] as String?,
        profileId: json['profileId'] as String?,
        fullName: json['fullName'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        url: json['url'] as String?,
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
