import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/cubit/set_quota_cubit/set_quota_cubit.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class DistributeBlocConsumer extends StatelessWidget {
  const DistributeBlocConsumer({
    super.key,
    required this.tryToDistribute,
  });
  final void Function(BuildContext) tryToDistribute;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetQuotaCubit, SetQuotaState>(
      listener: (context, state) {
        if (state is SetQuotaSuccess) {
          ShowSnackbar.showSnackBar(context, state.message, 'S');
        } else if (state is SetQuotaFailure) {
          ShowSnackbar.showSnackBar(context, state.error, 'F');
        }
      },
      builder: (context, state) {
        if (state is SetQuotaLoading) {
          return const CustomButtonWithIcon(
            child: 'Loading...',
            textColor: Colors.white,
            bgColor: Color.fromARGB(255, 218, 193, 112),
            icon: Symbols.progress_activity,
            onHoverColor: Color.fromARGB(255, 177, 136, 2),
            onTap: null,
          );
        }
        return CustomButtonWithIcon(
          child: 'Distribute',
          textColor: Colors.white,
          bgColor: kBtnColor,
          icon: Symbols.app_registration,
          onHoverColor: const Color.fromARGB(255, 20, 96, 37),
          onTap: () {
            tryToDistribute(context);
          },
        );
      },
    );
  }
}
