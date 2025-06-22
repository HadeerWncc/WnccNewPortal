import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/cubit/sales_quota_cubit/sales_quota_cubit.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/cubit/set_quota_cubit/set_quota_cubit.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class CopyDataBlocProvider extends StatelessWidget {
  const CopyDataBlocProvider({
    super.key,
    required this.tryToCopyQuota,
    required this.currentDate,
  });

  final DateTime currentDate;
  final void Function(BuildContext) tryToCopyQuota;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetQuotaCubit, SetQuotaState>(
      listener: (context, state) {
        if (state is CopyQuotaSuccess) {
          BlocProvider.of<SalesQuotaCubit>(context).getDailyQuotaByDate(
              DateFormat('yyyy-MM-dd').format(currentDate));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is CopyQuotaFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is CopyQuotaLoading) {
          return const CustomButtonWithIcon(
            bgColor: Color.fromARGB(255, 144, 191, 245),
            child: 'Loading...',
            textColor: Colors.white,
            icon: Symbols.progress_activity,
            onHoverColor: Color.fromARGB(255, 130, 178, 233),
            onTap: null,
          );
        }
        return CustomButtonWithIcon(
          bgColor: const Color(0xff1C84FD),
          child: 'Copy',
          textColor: Colors.white,
          icon: Symbols.file_copy,
          onHoverColor: const Color.fromARGB(255, 130, 178, 233),
          onTap: () {
            tryToCopyQuota(context);
          },
        );
      },
    );
  }
}
