import 'package:dio/dio.dart';
import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/user/domain/entities/profile_entity.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> completeProfile(String startupRoute);
  Future<UserModel> getCurrentUser();
  Future<UserModel> updateProfile(ProfileEntity profileEntity);
  Future<List<UserModel>> getAllUsers();
  Future<bool> selectStartUpRoute(String id, String routeName);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final ApiService apiService;

  UserRemoteDataSourceImpl({required this.apiService});
  @override
  Future<UserModel> completeProfile(String startupRoute) async {
    var result = await apiService.put(
        endPoint: 'api/CurrentUser/CompleteProfile',
        data: {"startupRoute": startupRoute});
    UserModel userModel = UserModel.fromJson(result['data']);
    return userModel;
  }

  @override
  Future<UserModel> getCurrentUser() async {
    var result =
        await apiService.get(endPoint: 'api/CurrentUser/GetCurrentUser');
        if(result["data"]==null || result["message"].contains("you are not authenticated") ){
          throw Exception("your session has expired. Please login again.");
        }
    UserModel userModel = UserModel.fromJson( result["data"]);
    return userModel;
  }

  @override
  Future<UserModel> updateProfile(ProfileEntity profileEntity) async {
    MultipartFile? multipartFile;
    if (profileEntity.image != null) {
      multipartFile = MultipartFile.fromBytes(
        profileEntity.image!,
        filename: 'upload.jpg',
      );
    }
    FormData formData = FormData.fromMap({
      'Id': profileEntity.id,
      'FullName': profileEntity.fullName,
      'Government': profileEntity.government,
      'City': profileEntity.city,
      'PhoneNumber': profileEntity.phoneNumber,
      'Image': multipartFile,
    });
    var result = await apiService.put(
      endPoint: 'api/Users/UpdatePersonal',
      data: formData,
    );
    UserModel userModel = UserModel.fromJson(result['data']);
    return userModel;
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    var result = await apiService.get(endPoint: 'api/Users/GetAll');
    List<UserModel> users = [];
    for (var user in result["data"]) {
      users.add(UserModel.fromJson(user));
    }
    return users;
  }

  @override
  Future<bool> selectStartUpRoute(String id, String routeName) async {
    var result = await apiService.put(
      endPoint: 'api/Users/SelectStartupRoute',
      data: {
        'Id': id,
        'StartupRoute': routeName,
      },
    );
    return result['data'];
  }
}
