import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:wncc_portal/app_setup.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/functions/setup_service_locator.dart';
import 'package:wncc_portal/core/utils/functions/update_http_client_certificate.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/reset_password_cubit.dart/reset_password_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/validate_code_cubit/validate_code_cubit.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/complain_details_cubit/complain_details_cubit.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/complain_replies_cubit/complain_replies_cubit.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/delete_complain_cubit/delete_complain_cubit.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/complains_cubit/complains_cubit.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/create_new_complain/create_new_complain_cubit.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/forwarded_complain_cubit/forwarded_complain_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/dispatch_delivery_orders_cubit/dispatch_delivery_order_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_agents_cubit/get_agents_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/close_request_cubit/close_request_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/create_request_cubit/create_request_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/forwarded_request_cubit/forwarded_request_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/remove_request_cubit/remove_request_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/request_details_cubit/request_details_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/request_replies_cubit/request_replies_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/requests_cubit/requests_cubit.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/cubit/sales_quota_cubit/sales_quota_cubit.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/cubit/set_quota_cubit/set_quota_cubit.dart';
import 'package:wncc_portal/features/to_do_list/data/datasources/to_do_local_data_source.dart';
import 'package:wncc_portal/features/to_do_list/data/models/to_do_list_progress.dart';
import 'package:wncc_portal/features/to_do_list/data/models/to_do_model.dart';
import 'package:wncc_portal/features/to_do_list/domain/repositories/to_do_list_repository.dart';
import 'package:wncc_portal/features/to_do_list/presentation/manager/providers/providers/to_do_list_provider.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/first_login_change_password_cubit/first_login_change_password_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/get_all_users_cubit/get_all_users_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/get_cities_cubit/get_cities_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoListProgressAdapter());
  Hive.registerAdapter(ToDoModelAdapter());
  await Hive.openBox<ToDoModel>('toDoDailyList');
  setupApp();
  HttpOverrides.global = MyHttpOverrides();
  final toDoLocalDataSource = ToDoLocalDataSource();
  final toDoRepository = ToDoRepository(localDataSource: toDoLocalDataSource);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ToDoListProvider(repository: toDoRepository),
    ),
  ], child: const WnccPortal()));
}

class WnccPortal extends StatelessWidget {
  const WnccPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return getIt<AuthCubit>()..checkAuthStatus();
        }),
        BlocProvider(create: (context) {
          return getIt<UpdateProfileCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<ForgetPasswordCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<ValidateCodeCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<ResetPasswordCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<FirstLoginChangePasswordCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<UserCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<CompleteProfileCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<GetCitiesCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<SalesQuotaCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<SetQuotaCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<GetAllDeliveryCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<RequestsCubit>()..getAllRequests();
        }),
        BlocProvider(create: (context) {
          return getIt<RequestDetailsCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<ForwardedRequestCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<RequestRepliesCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<CreateRequestCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<RemoveRequestCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<GetAllUsersCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<CloseRequestCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<ComplainsCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<CreateNewComplainCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<DeleteComplainCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<ComplainDetailsCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<ForwardedComplainCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<ComplainRepliesCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<GetAgentsCubit>()..getAgents();
        }),
        BlocProvider(
          create: (context) {
            return getIt<DispatchDeliveryOrderCubit>();
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'WinkySans',
          drawerTheme: const DrawerThemeData(
            backgroundColor: Colors.black,
          ),
          listTileTheme: const ListTileThemeData(
            iconColor: Colors.white,
            textColor: Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
