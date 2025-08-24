import 'package:get_it/get_it.dart';
import 'package:wncc_portal/core/repos/base_repos.dart';
import 'package:wncc_portal/core/utils/api_service.dart';
import 'package:wncc_portal/features/authentication/data/data_sources/auth_remote_date_source.dart';
import 'package:wncc_portal/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:wncc_portal/features/authentication/domain/repos/auth_repo.dart';
import 'package:wncc_portal/features/authentication/domain/use_cases/check_auth_use_case.dart';
import 'package:wncc_portal/features/authentication/domain/use_cases/forget_password_use_case.dart';
import 'package:wncc_portal/features/complains/data/datasources/complains_datasource.dart';
import 'package:wncc_portal/features/complains/data/repos/complain_repo_impl.dart';
import 'package:wncc_portal/features/complains/domain/repos/complain_repo.dart';
import 'package:wncc_portal/features/complains/presentation/managers/cubits/complain_details_cubit/complain_details_cubit.dart';
import 'package:wncc_portal/features/complains/presentation/managers/cubits/complain_replies_cubit/complain_replies_cubit.dart';
import 'package:wncc_portal/features/complains/presentation/managers/cubits/delete_complain_cubit/delete_complain_cubit.dart';
import 'package:wncc_portal/features/complains/presentation/managers/cubits/complains_cubit/complains_cubit.dart';
import 'package:wncc_portal/features/complains/presentation/managers/cubits/create_new_complain/create_new_complain_cubit.dart';
import 'package:wncc_portal/features/complains/presentation/managers/cubits/forwarded_complain_cubit/forwarded_complain_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/data/datasources/delivery_data_source.dart';
import 'package:wncc_portal/features/priority/delivery/data/repositories/delivery_repo_impl.dart';
import 'package:wncc_portal/features/priority/delivery/domain/repositories/delivery_repo.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/add_delivery_priority_cubit/add_delivery_priority_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/delete_delivery_priority_order_cubit/delete_delivery_priority_order_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/dispatch_delivery_orders_cubit/dispatch_delivery_order_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_agents_cubit/get_agents_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_delivery_by_id_cubit/get_delivery_by_id_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/undispatch_delivery_order_cubit/undispatch_delivery_order_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/data/datasources/pickup_data_source.dart';
import 'package:wncc_portal/features/priority/pickup/data/repositories/pickup_repo_impl.dart';
import 'package:wncc_portal/features/priority/pickup/domain/repositories/pickup_repo.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/add_pickup_priority_cubit/add_pickup_priority_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/delete_pickup_priority_cubit/delete_pickup_priority_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/dispatch_pickup_cubit/dispatch_pickup_order_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/get_all_pickup_cubit/getall_pickup_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/get_pickup_by_id_cubit/get_pickup_by_id_cubit.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/managers/cubits/undispatch_pickup_cubit/undispatch_pickup_cubit.dart';
import 'package:wncc_portal/features/requests/data/datasources/requests_data_source.dart';
import 'package:wncc_portal/features/requests/data/repositories/requests_repo_impl.dart';
import 'package:wncc_portal/features/requests/domain/repos/requests_repo.dart';
import 'package:wncc_portal/features/requests/presentation/managers/close_request_cubit/close_request_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/managers/create_request_cubit/create_request_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/managers/forwarded_request_cubit/forwarded_request_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/managers/remove_request_cubit/remove_request_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/managers/request_details_cubit/request_details_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/managers/request_replies_cubit/request_replies_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/managers/requests_cubit/requests_cubit.dart';
import 'package:wncc_portal/features/sales_quota/data/datasources/sales_quota_remote_datasource.dart';
import 'package:wncc_portal/features/sales_quota/data/repositories/daily_quota_repo_impl.dart';
import 'package:wncc_portal/features/sales_quota/domain/repositories/daily_quota_repo.dart';
import 'package:wncc_portal/features/sales_quota/domain/usecases/copy_quota_usecase.dart';
import 'package:wncc_portal/features/sales_quota/domain/usecases/daily_quota_usecase.dart';
import 'package:wncc_portal/features/sales_quota/domain/usecases/set_quota_usecase.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/cubit/sales_quota_cubit/sales_quota_cubit.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/cubit/set_quota_cubit/set_quota_cubit.dart';
import 'package:wncc_portal/features/user/domain/usecases/get_current_user_use_case.dart';
import 'package:wncc_portal/features/authentication/domain/use_cases/login_use_case.dart';
import 'package:wncc_portal/features/authentication/domain/use_cases/reset_password_use_case.dart';
import 'package:wncc_portal/features/authentication/domain/use_cases/validate_code_use_case.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/reset_password_cubit.dart/reset_password_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/validate_code_cubit/validate_code_cubit.dart';
import 'package:wncc_portal/features/user/data/datasources/first_login_change_password_remote_data_source.dart';
import 'package:wncc_portal/features/user/data/repositories/first_login_change_password_repo_impl.dart';
import 'package:wncc_portal/features/user/domain/repositories/first_login_change_password_repo.dart';
import 'package:wncc_portal/features/user/domain/usecases/first_login_change_pass_use_case.dart';
import 'package:wncc_portal/features/user/domain/usecases/update_profile_use_case.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/first_login_change_password_cubit/first_login_change_password_cubit.dart';
import 'package:wncc_portal/features/user/data/datasources/user_remote_data_source.dart';
import 'package:wncc_portal/features/user/data/repositories/user_repo_impl.dart';
import 'package:wncc_portal/features/user/domain/repositories/user_repo.dart';
import 'package:wncc_portal/features/user/domain/usecases/complete_profile_use_case.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/get_all_users_cubit/get_all_users_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/get_cities_cubit/get_cities_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  //DataSources
  // register Data Source as implementation for abstract class
  //Auth
  getIt.registerLazySingleton<AuthRemoteDateSource>(
      () => AuthRemoteDataSourceImpl(apiService: getIt<ApiService>()));

  //ChangePassowrd
  getIt.registerLazySingleton<FirstLoginChangePasswordRemoteDataSource>(() =>
      FirstLoginChangePasswordRemoteDataSourceImpl(
          apiService: getIt<ApiService>()));

  //userDataSource
  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(apiService: getIt<ApiService>()));

  //salesQuotaDataSource
  getIt.registerLazySingleton<SalesQuotaRemoteDatasource>(
      () => SalesQuotaRemoteDatasourceImpl(apiService: getIt<ApiService>()));

  //DeliveryDataSource
  getIt.registerLazySingleton<DeliveryDataSource>(
      () => DeliveryDataSourceImpl(apiService: getIt<ApiService>()));

  //PickupDataSource
  getIt.registerLazySingleton<PickupDataSource>(
      () => PickupDataSourceImpl(apiService: getIt<ApiService>()));

  //RequestsDataSource
  getIt.registerLazySingleton<RequestsDataSource>(
      () => RequestsDataSourceImpl(apiService: getIt<ApiService>()));

  //ComplainsDataSource
  getIt.registerLazySingleton<ComplainsDatasource>(
      () => ComplainsDatasourceImpl(apiService: getIt<ApiService>()));

  // Repositories
  //BaseRepo
  getIt.registerLazySingleton<BaseRepos>(() => BaseRepos());

  //Auth
  getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(authRemoteDateSource: getIt<AuthRemoteDateSource>()));

  //changePassword
  getIt.registerLazySingleton<FirstLoginChangePasswordRepo>(() =>
      FirstLoginChangePasswordRepoImpl(
          firstLoginChangePasswordRemoteDataSource:
              getIt<FirstLoginChangePasswordRemoteDataSource>()));

  //UserRepo
  getIt.registerLazySingleton<UserRepo>(
      () => UserRepoImpl(userRemoteDataSource: getIt<UserRemoteDataSource>()));

  //SalesQuotaRepo
  getIt.registerLazySingleton<DailyQuotaRepo>(() => DailyQuotaRepoImpl(
      salesQuotaRemoteDatasource: getIt<SalesQuotaRemoteDatasource>()));

  //DeliveryRepo
  getIt.registerLazySingleton<DeliveryRepo>(
      () => DeliveryRepoImpl(deliveryDataSource: getIt<DeliveryDataSource>()));

  //PickupRepo
  getIt.registerLazySingleton<PickupRepo>(
      () => PickupRepoImpl(pickupDataSource: getIt<PickupDataSource>()));

  //RequestsRepo
  getIt.registerLazySingleton<RequestsRepo>(
      () => RequestsRepoImpl(requestsDataSource: getIt<RequestsDataSource>()));

  //RequestsRepo
  getIt.registerLazySingleton<ComplainRepo>(() =>
      ComplainRepoImpl(complainsDatasource: getIt<ComplainsDatasource>()));

  // Use Cases
  //login Use Case
  getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(loginRepo: getIt<AuthRepo>()));

  //CheckAuth Use case
  getIt.registerLazySingleton<CheckAuthUseCase>(() => CheckAuthUseCase());

  //ForgetPassword Use case
  getIt.registerLazySingleton<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(loginRepo: getIt<AuthRepo>()));

  //Validate Code Use Case
  getIt.registerLazySingleton<ValidateCodeUseCase>(
      () => ValidateCodeUseCase(loginRepo: getIt<AuthRepo>()));

  //Reset Password Use Case
  getIt.registerLazySingleton<ResetPasswordUseCase>(
      () => ResetPasswordUseCase(loginRepo: getIt<AuthRepo>()));

  //Change Password Use Case
  getIt.registerLazySingleton<FirstLoginChangePassUseCase>(() =>
      FirstLoginChangePassUseCase(
          firstLoginChangePasswordRepo: getIt<FirstLoginChangePasswordRepo>()));

  //Get Current User Use Case
  getIt.registerLazySingleton<GetCurrentUserUseCase>(
      () => GetCurrentUserUseCase(userRepo: getIt<UserRepo>()));

  //Complete Profile Use Case
  getIt.registerLazySingleton<UserUseCases>(
      () => UserUseCases(userRepo: getIt<UserRepo>()));

  //Update Profile Use Case
  getIt.registerLazySingleton<UpdateProfileUseCase>(
      () => UpdateProfileUseCase(userRepo: getIt<UserRepo>()));

  //Sales Quota Use Case
  getIt.registerLazySingleton<DailyQuotaUsecase>(
      () => DailyQuotaUsecase(dailyQuotaRepo: getIt<DailyQuotaRepo>()));

  //Set Quota Use Case
  getIt.registerLazySingleton<SetQuotaUsecase>(
      () => SetQuotaUsecase(dailyQuotaRepo: getIt<DailyQuotaRepo>()));

  //Copy Quota Use Case
  getIt.registerLazySingleton<CopyQuotaUsecase>(
      () => CopyQuotaUsecase(dailyQuotaRepo: getIt<DailyQuotaRepo>()));

  // Cubits
  //AuthCubit
  getIt.registerFactory<AuthCubit>(
      () => AuthCubit(getIt<LoginUseCase>(), getIt<CheckAuthUseCase>()));

  //ForgetPasswordCubit
  getIt.registerFactory<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(getIt<ForgetPasswordUseCase>()));

  //ValidateCodeCubit
  getIt.registerFactory<ValidateCodeCubit>(
      () => ValidateCodeCubit(getIt<ValidateCodeUseCase>()));

  //ResetPasswordCubit
  getIt.registerFactory<ResetPasswordCubit>(
      () => ResetPasswordCubit(getIt<ResetPasswordUseCase>()));

  //ChangePasswordCubit
  getIt.registerFactory<FirstLoginChangePasswordCubit>(() =>
      FirstLoginChangePasswordCubit(getIt<FirstLoginChangePassUseCase>()));

  //GetCurrentUserCubit
  getIt.registerFactory<UserCubit>(() => UserCubit(
        getIt<GetCurrentUserUseCase>(),
        getIt<BaseRepos>(),
      ));

  //GetCurrentUserCubit
  getIt.registerFactory<GetCitiesCubit>(() => GetCitiesCubit(
        getIt<BaseRepos>(),
      ));

  //GetAllUsersCubit
  getIt.registerFactory<GetAllUsersCubit>(
      () => GetAllUsersCubit(getIt<UserRepo>()));

  //CompleteProfileCubit
  getIt.registerFactory<CompleteProfileCubit>(
      () => CompleteProfileCubit(getIt<UserUseCases>()));

  //UpdateProfileCubit
  getIt.registerFactory<UpdateProfileCubit>(
      () => UpdateProfileCubit(getIt<UpdateProfileUseCase>()));

  //SalesQuotaCubit
  getIt.registerFactory<SalesQuotaCubit>(
      () => SalesQuotaCubit(getIt<DailyQuotaUsecase>()));

  //SetQuotaCubit
  getIt.registerFactory<SetQuotaCubit>(() => SetQuotaCubit(
        getIt<SetQuotaUsecase>(),
        getIt<CopyQuotaUsecase>(),
      ));

  //DeliveryCubits:

  //GetAllDeliveryCubit
  getIt.registerFactory<GetAllDeliveryCubit>(
      () => GetAllDeliveryCubit(getIt<DeliveryRepo>()));

  //GetByIdCubit
  getIt.registerFactory<GetDeliveryByIdCubit>(
      () => GetDeliveryByIdCubit(getIt<DeliveryRepo>()));

  //AddToPriortyCubit
  getIt.registerFactory<AddDeliveryPriorityCubit>(
      () => AddDeliveryPriorityCubit(getIt<DeliveryRepo>()));

  //DeletePriorityOrderCubit
  getIt.registerFactory<DeleteDeliveryPriorityOrderCubit>(
      () => DeleteDeliveryPriorityOrderCubit(getIt<DeliveryRepo>()));

  //DispatchCubit
  getIt.registerFactory<DispatchDeliveryOrderCubit>(
      () => DispatchDeliveryOrderCubit(getIt<DeliveryRepo>()));

  //UnDispatchCubit
  getIt.registerFactory<UndispatchDeliveryOrderCubit>(
      () => UndispatchDeliveryOrderCubit(getIt<DeliveryRepo>()));

  //getAgentsCubit
  getIt.registerFactory<GetAgentsCubit>(
      () => GetAgentsCubit(getIt<DeliveryRepo>()));

  //Pickup Cubits

  //AddPickupPriorityCubit
  getIt.registerFactory<AddPickupPriorityCubit>(
      () => AddPickupPriorityCubit(getIt<PickupRepo>()));

  //UndispatchPickupCubit
  getIt.registerFactory<UndispatchPickupCubit>(
      () => UndispatchPickupCubit(getIt<PickupRepo>()));

  //deletePickupCubit
  getIt.registerFactory<DeletePickupPriorityCubit>(
      () => DeletePickupPriorityCubit(getIt<PickupRepo>()));

  //dispatchPickupCubit
  getIt.registerFactory<DispatchPickupOrderCubit>(
      () => DispatchPickupOrderCubit(getIt<PickupRepo>()));

  //getAllCubit
  getIt.registerFactory<GetallPickupCubit>(
      () => GetallPickupCubit(getIt<PickupRepo>()));

  //getByIdCubit
  getIt.registerFactory<GetPickupByIdCubit>(
      () => GetPickupByIdCubit(getIt<PickupRepo>()));

  //RequestsCubit

  //GetAllRequestsCubit
  getIt.registerFactory<RequestsCubit>(
      () => RequestsCubit(getIt<RequestsRepo>()));

  //RequestDeatailsCubit
  getIt.registerFactory<RequestDetailsCubit>(
      () => RequestDetailsCubit(getIt<RequestsRepo>()));

  //ForwardedCubit
  getIt.registerFactory<ForwardedRequestCubit>(
      () => ForwardedRequestCubit(getIt<RequestsRepo>()));

  //ForwardedCubit
  getIt.registerFactory<RequestRepliesCubit>(
      () => RequestRepliesCubit(getIt<RequestsRepo>()));

  //CreateNewRequestCubit
  getIt.registerFactory<CreateRequestCubit>(
      () => CreateRequestCubit(getIt<RequestsRepo>()));

  //RemoveRequestCubit
  getIt.registerFactory<RemoveRequestCubit>(
      () => RemoveRequestCubit(getIt<RequestsRepo>()));

  //closeRequestCubit
  getIt.registerFactory<CloseRequestCubit>(
      () => CloseRequestCubit(getIt<RequestsRepo>()));

  // Complains

  //GetAllComplainsCubit
  getIt.registerFactory<ComplainsCubit>(
      () => ComplainsCubit(getIt<ComplainRepo>()));

  //create new complain Cubit
  getIt.registerFactory<CreateNewComplainCubit>(
      () => CreateNewComplainCubit(getIt<ComplainRepo>()));

  //delete complain Cubit
  getIt.registerFactory<DeleteComplainCubit>(
      () => DeleteComplainCubit(getIt<ComplainRepo>()));

  //get complain Cubit
  getIt.registerFactory<ComplainDetailsCubit>(
      () => ComplainDetailsCubit(getIt<ComplainRepo>()));

  //get forwarded complain Cubit
  getIt.registerFactory<ForwardedComplainCubit>(
      () => ForwardedComplainCubit(getIt<ComplainRepo>()));

  //get Replies complain Cubit
  getIt.registerFactory<ComplainRepliesCubit>(
      () => ComplainRepliesCubit(getIt<ComplainRepo>()));
}
