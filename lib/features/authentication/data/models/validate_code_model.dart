import 'package:equatable/equatable.dart';

class ValidateCodeModel extends Equatable {
  final String? id;
  final String? email;
  final String? token;

  const ValidateCodeModel({this.id, this.email, this.token});

  factory ValidateCodeModel.fromJson(Map<String, dynamic> json) {
    return ValidateCodeModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'token': token,
      };

  @override
  List<Object?> get props => [id, email, token];
}
