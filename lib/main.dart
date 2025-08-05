import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/app_setup.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/functions/setup_service_locator.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/reset_password_cubit.dart/reset_password_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/validate_code_cubit/validate_code_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/managers/forwarded_request_cubit/forwarded_request_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/managers/request_details_cubit/request_details_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/managers/request_replies_cubit/request_replies_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/managers/requests_cubit/requests_cubit.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/cubit/sales_quota_cubit/sales_quota_cubit.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/cubit/set_quota_cubit/set_quota_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/first_login_change_password_cubit/first_login_change_password_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/get_cities_cubit/get_cities_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupApp();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const WnccPortal());
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
