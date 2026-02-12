import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:wncc_portal/app_setup.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/functions/setup_service_locator.dart';
import 'package:wncc_portal/core/utils/functions/update_http_client_certificate.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/reset_password_cubit.dart/reset_password_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/validate_code_cubit/validate_code_cubit.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/manager/cubits/fact_vs_cust_compare_cubit/fact_vs_cust_compare_cubit.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/manager/cubits/fact_vs_cust_cubit/fact_vs_cust_cubit.dart';
import 'package:wncc_portal/features/reports/morningMeating/presentation/manager/cubites/cubit/morning_meeting_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/dispatch_delivery_orders_cubit/dispatch_delivery_order_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_agents_cubit/get_agents_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payment_cubit/payments_cubit.dart';
import 'package:wncc_portal/features/home/updates/presentation/manager/cubits/updates_cubit/updates_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/manager/cubits/payments_details_cubit/payments_details_cubit.dart';
import 'package:wncc_portal/features/reports/payment/presentation/views/widgets/payments_daily_header.dart';
import 'package:wncc_portal/features/reports/pending/presentation/manager/pending_cubit/pending_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/first_login_change_password_cubit/first_login_change_password_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/get_all_users_cubit/get_all_users_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/get_cities_cubit/get_cities_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/select_start_up_route_cubit/select_start_up_route_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // Hive.registerAdapter(ToDoListProgressAdapter());
  // Hive.registerAdapter(ToDoModelAdapter());
  // await Hive.openBox<ToDoModel>('toDoDailyList');
  setupApp();
  HttpOverrides.global = MyHttpOverrides();

  // final toDoLocalDataSource = ToDoLocalDataSource();
  // final toDoRepository = ToDoRepository(localDataSource: toDoLocalDataSource);

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
          return getIt<SelectStartUpRouteCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<FactVsCustCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<FactVsCustCompareCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<MorningMeetingCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<PaymentsCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<PaymentsDetailsCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<GetAllUsersCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<UpdatesCubit>();
        }),
        BlocProvider(create: (context) {
          return getIt<GetAgentsCubit>()..getAgents();
        }),
        BlocProvider(
          create: (context) {
            return getIt<DispatchDeliveryOrderCubit>();
          },
        ),
        BlocProvider(
          create: (context) {
            return getIt<PendingCubit>();
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          MonthYearPickerLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'NotoSerif',
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
