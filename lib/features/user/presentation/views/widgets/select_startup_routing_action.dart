import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/select_start_up_route_cubit/select_start_up_route_cubit.dart';

class SelectStartupRoutingAction extends StatelessWidget {
  const SelectStartupRoutingAction({
    super.key,
    required this.userId,
    required this.routeName,
  });
  final String userId;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtonWithIcon(
          onTap: () {
            GoRouter.of(context).push(AppRouter.thanksPagePath);
          },
          child: 'Skip',
          bgColor: const Color(0xffF1F1F3),
          textColor: Colors.black,
          icon: Symbols.swipe_up,
          onHoverColor: const Color.fromARGB(255, 179, 179, 179),
        ),
        const SizedBox(width: 13),
        BlocConsumer<SelectStartUpRouteCubit, SelectStartUpRouteState>(
          listener: (context, state) {
            if (state is SelectStartUpRouteSuccess) {
              BlocProvider.of<CompleteProfileCubit>(context)
                  .completeProfile(routeName);
              ShowSnackbar.showSnackBar(context, 'Update Successfully', 'S');
              GoRouter.of(context).push(AppRouter.thanksPagePath);
            } else if (state is SelectStartUpRouteFailure) {
              ShowSnackbar.showSnackBar(context, state.errorMessage, 'F');
            }
          },
          builder: (context, state) {
            return CustomButtonWithIcon(
              onTap: () {
                selectStartUpRoute(context);
              },
              child: 'Submit',
              bgColor: const Color(0xffE9F3FF),
              textColor: Colors.blueAccent,
              icon: Symbols.done_all,
              onHoverColor: kBtnColor,
            );
          },
        ),
      ],
    );
  }

  void selectStartUpRoute(BuildContext context) async {
    await context
        .read<SelectStartUpRouteCubit>()
        .selectStartUpRoute(userId, routeName);
  }
}
