import 'package:equatable/equatable.dart';

class UpdatedBy extends Equatable {
  final String? id;
  final String? fullName;
  final String? phoneNumber;
  final dynamic url;

  const UpdatedBy({this.id, this.fullName, this.phoneNumber, this.url});

  factory UpdatedBy.fromJson(Map<String, dynamic> json) => UpdatedBy(
        id: json['id'] as String?,
        fullName: json['fullName'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        url: json['url'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'url': url,
      };

  @override
  List<Object?> get props => [id, fullName, phoneNumber, url];
}
