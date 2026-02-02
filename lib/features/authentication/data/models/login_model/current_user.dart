import 'package:equatable/equatable.dart';

class CurrentUser extends Equatable {
  final List<dynamic>? permissions;
  final String? id;
  final String? profileId;
  final String? fullName;
  final String? userName;
  final String? email;
  final String? government;
  final String? city;
  final dynamic manager;
  final String? managerId;
  final dynamic department;
  final String? departmentId;
  final String? position;
  final String? phoneNumber;
  final dynamic imageUrl;
  final dynamic thumbnailUrl;
  final dynamic startupRoute;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isDeleted;
  final bool? isDeactivated;
  final bool? isConfigured;
  final bool? is2FaRequired;
  final bool? enableNotification;
  final bool? enableForwarding;
  final bool? enableChating;
  final int? profileType;
  final int? scope;
  final int? notificationChannel;
  final List<dynamic>? roles;

  const CurrentUser({
    this.permissions,
    this.id,
    this.profileId,
    this.fullName,
    this.userName,
    this.email,
    this.government,
    this.city,
    this.manager,
    this.managerId,
    this.department,
    this.departmentId,
    this.position,
    this.phoneNumber,
    this.imageUrl,
    this.thumbnailUrl,
    this.startupRoute,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.isDeactivated,
    this.isConfigured,
    this.is2FaRequired,
    this.enableNotification,
    this.enableForwarding,
    this.enableChating,
    this.profileType,
    this.scope,
    this.notificationChannel,
    this.roles,
  });

  factory CurrentUser.fromJson(Map<String, dynamic> json) => CurrentUser(
        permissions: json['permissions'] as List<dynamic>?,
        id: json['id'] as String?,
        profileId: json['profileId'] as String?,
        fullName: json['fullName'] as String?,
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        government: json['government'] as String?,
        city: json['city'] as String?,
        manager: json['manager'] as dynamic,
        managerId: json['managerId'] as String?,
        department: json['department'] as dynamic,
        departmentId: json['departmentId'] as String?,
        position: json['position'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        imageUrl: json['imageUrl'] as dynamic,
        thumbnailUrl: json['thumbnailUrl'] as dynamic,
        startupRoute: json['startupRoute'] as dynamic,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        isDeleted: json['isDeleted'] as bool?,
        isDeactivated: json['isDeactivated'] as bool?,
        isConfigured: json['isConfigured'] as bool?,
        is2FaRequired: json['is2FaRequired'] as bool?,
        enableNotification: json['enableNotification'] as bool?,
        enableForwarding: json['enableForwarding'] as bool?,
        enableChating: json['enableChating'] as bool?,
        profileType: json['profileType'] as int?,
        scope: json['scope'] as int?,
        notificationChannel: json['notificationChannel'] as int?,
        roles: json['roles'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'permissions': permissions,
        'id': id,
        'profileId': profileId,
        'fullName': fullName,
        'userName': userName,
        'email': email,
        'government': government,
        'city': city,
        'manager': manager,
        'managerId': managerId,
        'department': department,
        'departmentId': departmentId,
        'position': position,
        'phoneNumber': phoneNumber,
        'imageUrl': imageUrl,
        'thumbnailUrl': thumbnailUrl,
        'startupRoute': startupRoute,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'isDeleted': isDeleted,
        'isDeactivated': isDeactivated,
        'isConfigured': isConfigured,
        'is2FaRequired': is2FaRequired,
        'enableNotification': enableNotification,
        'enableForwarding': enableForwarding,
        'enableChating': enableChating,
        'profileType': profileType,
        'scope': scope,
        'notificationChannel': notificationChannel,
        'roles': roles,
      };

  @override
  List<Object?> get props {
    return [
      permissions,
      id,
      profileId,
      fullName,
      userName,
      email,
      government,
      city,
      manager,
      managerId,
      department,
      departmentId,
      position,
      phoneNumber,
      imageUrl,
      thumbnailUrl,
      startupRoute,
      createdAt,
      updatedAt,
      isDeleted,
      isDeactivated,
      isConfigured,
      is2FaRequired,
      enableNotification,
      enableForwarding,
      enableChating,
      profileType,
      scope,
      notificationChannel,
      roles,
    ];
  }
}
