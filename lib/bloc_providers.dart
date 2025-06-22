import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/reset_password_cubit.dart/reset_password_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/validate_code_cubit/validate_code_cubit.dart';
import 'package:wncc_portal/core/utils/functions/setup_service_locator.dart';

List<BlocProvider> blocProviders = [
  BlocProvider(create: (context) => getIt<AuthCubit>()..checkAuthStatus()),
  BlocProvider(create: (context) => getIt<ForgetPasswordCubit>()),
  BlocProvider(create: (context) => getIt<ValidateCodeCubit>()),
  BlocProvider(create: (context) => getIt<ResetPasswordCubit>()),
];
