import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_configuration_item.dart';

class CustomCheckBoxConfiguration extends StatefulWidget {
  const CustomCheckBoxConfiguration({
    super.key,
  });

  @override
  State<CustomCheckBoxConfiguration> createState() =>
      _CustomCheckBoxConfigurationState();
}

class _CustomCheckBoxConfigurationState
    extends State<CustomCheckBoxConfiguration> {
  String selectedValue = 'change';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomConfigurationItem(
          title: 'Change Your Configurations',
          subTitle: 'If you want change configurations.',
          selected: (selectedValue == 'change') ? true : false,
          onTap: () {
            setState(() {
              selectedValue = 'change';
            });
          },
        ),
        const SizedBox(
          height: 30,
        ),
        CustomConfigurationItem(
          title: 'With Current Configurations',
          subTitle: 'If you want skip configurations.',
          selected: (selectedValue == 'skip') ? true : false,
          onTap: () {
            setState(() {
              selectedValue = 'skip';
            });
          },
        ),
        const SizedBox(
          height: 40,
        ),
        BlocConsumer<CompleteProfileCubit, CompleteProfileState>(
          listener: (context, state) {
            if (state is CompleteProfileSuccess) {
              GoRouter.of(context).pushReplacement(AppRouter.homePath);
            } else if (state is CompleteProfileFailure) {
              ShowSnackbar.showSnackBar(context, state.error, 'F');
            }
          },
          builder: (context, state) {
            if (state is CompleteProfileLoading) {
              return const CustomButton(
                contant: 'Loading..',
                color: kloadingColor,
                onTap: null,
              );
            }
            return CustomButton(
              contant: 'Continue',
              color: kBtnColor,
              onTap: () {
                (selectedValue == 'change')
                    ? GoRouter.of(context)
                        .push(AppRouter.changePersonalInfoFirstLogin)
                    : completeProfile(context);
              },
            );
          },
        )
      ],
    );
  }

  void completeProfile(BuildContext context) async {
    await context.read<CompleteProfileCubit>().completeProfile('');
  }
}
