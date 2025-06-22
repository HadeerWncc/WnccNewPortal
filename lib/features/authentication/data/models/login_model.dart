import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final bool? isAuthenticated;
  final String? username;
  final String? email;
  final String? fullName;
  final String? token;
  final String? refreshToken;
  final DateTime? refreshTokenExpirsOn;
  final List<dynamic>? roles;
  final List<dynamic>? messages;
  final bool? hasConfigurations;
  final bool? isDeleted;
  final bool? isActive;
  final bool? twoFactorEnabled;

  const LoginModel(
      {this.isAuthenticated,
      this.username,
      this.email,
      this.fullName,
      this.token,
      this.refreshToken,
      this.refreshTokenExpirsOn,
      this.roles,
      this.messages,
      this.hasConfigurations,
      this.isDeleted,
      this.isActive,
      this.twoFactorEnabled});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        isAuthenticated: json['isAuthenticated'] as bool?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        fullName: json['fullName'] as String?,
        token: json['token'] as String?,
        refreshToken: json['refreshToken'] as String?,
        refreshTokenExpirsOn: json['refreshTokenExpirsOn'] == null
            ? null
            : DateTime.parse(json['refreshTokenExpirsOn'] as String),
        roles: json['roles'] as List<dynamic>?,
        messages: json['messages'] as List<dynamic>?,
        hasConfigurations: json['isConfigure'] as bool?,
        isDeleted: json['isDeleted'] as bool?,
        isActive: json['isActive'] as bool?,
        twoFactorEnabled: json['twoFactorEnabled'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'isAuthenticated': isAuthenticated,
        'username': username,
        'email': email,
        'fullName': fullName,
        'token': token,
        'refreshToken': refreshToken,
        'refreshTokenExpirsOn': refreshTokenExpirsOn?.toIso8601String(),
        'roles': roles,
        'messages': messages,
        'hasConfigurations': hasConfigurations,
        'isDeleted': isDeleted,
        'isActive': isActive,
        'twoFactorEnabled': twoFactorEnabled,
      };

  @override
  List<Object?> get props {
    return [
      isAuthenticated,
      username,
      email,
      fullName,
      token,
      refreshToken,
      refreshTokenExpirsOn,
      roles,
      messages,
      hasConfigurations,
      isDeleted,
      isActive,
      twoFactorEnabled,
    ];
  }
}
