import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/authentication/data/models/login_model.dart';
import 'package:wncc_portal/features/authentication/data/models/validate_code_model.dart';
import 'package:wncc_portal/features/authentication/domain/entities/login_entity.dart';
import 'package:wncc_portal/features/authentication/domain/entities/reset_password_entity.dart';
import 'package:wncc_portal/features/authentication/domain/entities/validate_code_entity.dart';

abstract class AuthRemoteDateSource {
  Future<LoginModel> login({LoginEntity loginEntity});
  Future<bool> forgetPassword({String email});
  Future<ValidateCodeModel> validateCode(
      {ValidateCodeEntity validateCodeEntity});
  Future<bool> resetPassword({ResetPasswordEntity resetPasswordEntity});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDateSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});
  @override
  Future<LoginModel> login({LoginEntity? loginEntity}) async {
    LoginModel userModel;
    var result = await apiService.post(
      endPoint: 'api/Authentication/SignIn',
      data: {
        "userName": loginEntity?.userName,
        "password": loginEntity?.password,
        "remmemberMe": loginEntity?.remmemberMe,
      },
    );
    userModel = LoginModel.fromJson(result["data"]);
    return userModel;
  }

  @override
  Future<bool> forgetPassword({String? email}) async {
    var result = await apiService.post(
      endPoint: 'api/Authentication/SendResetPasswordCode',
      data: {
        "email": email,
      },
    );
    bool successed = result["successed"] as bool;
    return successed;
  }

  @override
  Future<ValidateCodeModel> validateCode(
      {ValidateCodeEntity? validateCodeEntity}) async {
    var result = await apiService.post(
      endPoint: 'api/Authentication/ConfirmResetPasswordCode',
      data: {
        "email": validateCodeEntity!.email,
        "code": validateCodeEntity.code,
      },
    );
    ValidateCodeModel validateCodeModel =
        ValidateCodeModel.fromJson(result["data"]);
    return validateCodeModel;
  }

  @override
  Future<bool> resetPassword({ResetPasswordEntity? resetPasswordEntity}) async {
    var result = await apiService.post(
      endPoint: 'api/Authentication/ConfirmResetPassword',
      data: {
        "email": resetPasswordEntity!.email,
        "token": resetPasswordEntity.token, //token from confirmCode
        "newPassword": resetPasswordEntity.newPassword,
        "confirmPassword": resetPasswordEntity.confirmPassword,
      },
    );
    bool successed = result["successed"] as bool;
    return successed;
  }
}
