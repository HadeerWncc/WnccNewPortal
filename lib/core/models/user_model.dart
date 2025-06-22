import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? adminstratorId;
  final String? id;
  final String? userId;
  final String? fullName;
  final dynamic imageUrl;
  final dynamic thumbnailUrl;
  final String? userName;
  final String? email;
  final String? state;
  final String? city;
  final String? departmentId;
  final dynamic managerId;
  final String? department;
  final dynamic manager;
  final String? position;
  final dynamic startupRoute;
  final int? type;
  final String? phoneNumber;
  final List<dynamic>? roles;
  final List<dynamic>? favouriteRoutes;
  final String? createdAt;
  final String? lastUpdatedAt;
  final dynamic createdBy;
  final bool? isDeleted;
  final bool? hasConfigurations;
  final bool? isActive;

  const UserModel({
    this.adminstratorId,
    this.id,
    this.userId,
    this.fullName,
    this.imageUrl,
    this.thumbnailUrl,
    this.userName,
    this.email,
    this.state,
    this.city,
    this.departmentId,
    this.managerId,
    this.department,
    this.manager,
    this.position,
    this.startupRoute,
    this.type,
    this.phoneNumber,
    this.roles,
    this.favouriteRoutes,
    this.createdAt,
    this.lastUpdatedAt,
    this.createdBy,
    this.isDeleted,
    this.hasConfigurations,
    this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        adminstratorId: json['adminstratorId'] as String?,
        id: json['id'] as String?,
        userId: json['userId'] as String?,
        fullName: json['fullName'] as String?,
        imageUrl: json['imageUrl'] as dynamic,
        thumbnailUrl: json['thumbnailUrl'] as dynamic,
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        state: json['government'] as String?,
        city: json['city'] as String?,
        departmentId: json['departmentId'] as String?,
        managerId: json['managerId'] as dynamic,
        department: json['departmentName'] as String?,
        manager: json['managerName'] as dynamic,
        position: json['positionName'] as String?,
        startupRoute: json['startupRoute'] as dynamic,
        type: json['type'] as int?,
        phoneNumber: json['phoneNumber'] as String?,
        roles: json['roles'] as List<dynamic>?,
        favouriteRoutes: json['favourite_Routes'] as List<dynamic>?,
        createdAt: json['createdAt'] as String?,
        lastUpdatedAt: json['lastUpdatedAt'] as String?,
        createdBy: json['createdBy'] as dynamic,
        isDeleted: json['isDeleted'] as bool?,
        isActive: json['isActive'] as bool?,
        hasConfigurations: json['isConfigure'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'adminstratorId': adminstratorId,
        'id': id,
        'userId': userId,
        'fullName': fullName,
        'imageUrl': imageUrl,
        'thumbnailUrl': thumbnailUrl,
        'userName': userName,
        'email': email,
        'state': state,
        'city': city,
        'departmentId': departmentId,
        'managerId': managerId,
        'department': department,
        'manager': manager,
        'position': position,
        'startupRoute': startupRoute,
        'type': type,
        'phoneNumber': phoneNumber,
        'roles': roles,
        'favourite_Routes': favouriteRoutes,
        'createdAt': createdAt,
        'lastUpdatedAt': lastUpdatedAt,
        'createdBy': createdBy,
        'isDeleted': isDeleted,
        'hasConfigurations': hasConfigurations,
      };

  @override
  List<Object?> get props {
    return [
      adminstratorId,
      id,
      userId,
      fullName,
      imageUrl,
      thumbnailUrl,
      userName,
      email,
      state,
      city,
      departmentId,
      managerId,
      department,
      manager,
      position,
      startupRoute,
      type,
      phoneNumber,
      roles,
      favouriteRoutes,
      createdAt,
      lastUpdatedAt,
      createdBy,
      isDeleted,
      hasConfigurations,
    ];
  }
}
