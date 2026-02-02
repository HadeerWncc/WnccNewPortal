import 'package:equatable/equatable.dart';

import 'current_user.dart';

class LoginModel extends Equatable {
  final bool? isAuthenticated;
  final String? token;
  final String? refreshToken;
  final DateTime? refreshTokenExpirsOn;
  final bool? is2FaRequred;
  final CurrentUser? currentUser;

  const LoginModel({
    this.isAuthenticated,
    this.token,
    this.refreshToken,
    this.refreshTokenExpirsOn,
    this.is2FaRequred,
    this.currentUser,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        isAuthenticated: json['isAuthenticated'] as bool?,
        token: json['token'] as String?,
        refreshToken: json['refreshToken'] as String?,
        refreshTokenExpirsOn: json['refreshTokenExpirsOn'] == null
            ? null
            : DateTime.parse(json['refreshTokenExpirsOn'] as String),
        is2FaRequred: json['is2FARequred'] as bool?,
        currentUser: json['currentUser'] == null
            ? null
            : CurrentUser.fromJson(json['currentUser'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'isAuthenticated': isAuthenticated,
        'token': token,
        'refreshToken': refreshToken,
        'refreshTokenExpirsOn': refreshTokenExpirsOn?.toIso8601String(),
        'is2FARequred': is2FaRequred,
        'currentUser': currentUser?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      isAuthenticated,
      token,
      refreshToken,
      refreshTokenExpirsOn,
      is2FaRequred,
      currentUser,
    ];
  }
}
