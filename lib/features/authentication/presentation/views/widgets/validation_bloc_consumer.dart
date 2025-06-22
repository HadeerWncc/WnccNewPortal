import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/validate_code_cubit/validate_code_cubit.dart';

class ValidationBlocConsumer extends StatelessWidget {
  const ValidationBlocConsumer({
    super.key,
    required this.validation,
  });
  final void Function(BuildContext) validation;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ValidateCodeCubit, ValidateCodeState>(
      listener: (context, state) {
        if (state is ValidateCodeSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.resetPasswordPath,
              extra: state.validateCodeModel);
        } else if (state is ValidateCodeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        if (state is ValidateCodeLoading) {
          return const CustomButton(
            contant: "Loading..",
            color: kloadingColor,
            fontSize: 14,
            onTap: null,
          );
        }
        return CustomButton(
          contant: "Submit",
          color: kBtnColor,
          fontSize: 14,
          onTap: () {
            validation(context);
          },
        );
      },
    );
  }
}
