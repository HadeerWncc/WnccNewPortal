import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/update_profile_cubit/update_profile_cubit.dart';

class ChangeProfileBlocConsumer extends StatelessWidget {
  const ChangeProfileBlocConsumer({
    super.key,
    required this.tryToUpdateProfile,
  });
  final void Function(BuildContext) tryToUpdateProfile;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile Updated Successfully')),
          );
        } else if (state is UpdateProfileFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        if (state is UpdateProfileLoading) {
          return const CustomButtonWithIcon(
            onTap: null,
            child: 'Loading',
            bgColor: Color(0xffF8BE03),
            textColor: Colors.white,
            icon: Symbols.progress_activity,
            onHoverColor: Color.fromARGB(255, 244, 204, 73),
          );
        }
        return CustomButtonWithIcon(
          child: 'Save Changes',
          textColor: Colors.white,
          bgColor: const Color(0xffF8BE03),
          icon: Symbols.bookmarks,
          onHoverColor: const Color.fromARGB(255, 244, 204, 73),
          onTap: () {
            tryToUpdateProfile(
              context,
            );
          },
        );
      },
    );
  }
}
