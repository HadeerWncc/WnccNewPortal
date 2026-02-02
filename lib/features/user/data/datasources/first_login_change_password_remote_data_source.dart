import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/core/utils/entites/change_password_entity.dart';

abstract class FirstLoginChangePasswordRemoteDataSource {
  Future<bool> changePassword({ChangePasswordEntity changePasswordEnitiy});
}

class FirstLoginChangePasswordRemoteDataSourceImpl
    extends FirstLoginChangePasswordRemoteDataSource {
  final ApiService apiService;

  FirstLoginChangePasswordRemoteDataSourceImpl({required this.apiService});
  @override
  Future<bool> changePassword(
      {ChangePasswordEntity? changePasswordEnitiy}) async {
    var result = await apiService.put(
      endPoint: 'api/Authentication/ChangePassword',
      data: {
        "id": changePasswordEnitiy?.id,
        "currentPassword": changePasswordEnitiy?.currentPassword,
        "password": changePasswordEnitiy?.newPassword,
        "confirmPassword": changePasswordEnitiy?.confirmPassword,
      },
    );
    bool successed = result["successed"] as bool;
    return successed;
  }
}
