import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        } else if (state is SetQuotaFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
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
          bgColor: const Color(0xffF6BF03),
          icon: Symbols.app_registration,
          onHoverColor: const Color.fromARGB(255, 177, 136, 2),
          onTap: () {
            tryToDistribute(context);
          },
        );
      },
    );
  }
}
