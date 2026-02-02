import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class BlocConsumerUpdateProfile extends StatelessWidget {
  const BlocConsumerUpdateProfile({
    super.key,
    required this.tryToUpdateProfile,
  });
  final void Function(BuildContext) tryToUpdateProfile;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          GoRouter.of(context).push(
            AppRouter.changePasswordPath,
            extra: state.user,
          );
        } else if (state is UpdateProfileFailure) {
          ShowSnackbar.showSnackBar(context, state.error, 'F');
        }
      },
      builder: (context, state) {
        if (state is UpdateProfileLoading) {
          return const CustomButtonWithIcon(
            onTap: null,
            child: 'Loading',
            bgColor: Color(0xffE9F3FF),
            textColor: Colors.blueAccent,
            icon: Symbols.progress_activity,
            onHoverColor: kBtnColor,
          );
        }
        return CustomButtonWithIcon(
          onTap: () {
            tryToUpdateProfile(context);
          },
          child: 'Submit',
          bgColor: const Color(0xffE9F3FF),
          textColor: Colors.blueAccent,
          icon: Symbols.done_all,
          onHoverColor: kBtnColor,
        );
      },
    );
  }
}
