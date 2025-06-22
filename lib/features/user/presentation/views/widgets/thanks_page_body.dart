import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/form_heading.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';

class ThanksPageBody extends StatelessWidget {
  const ThanksPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FormHeading(
            title: 'Thank you',
            subTitle: 'We wish you success and good luck.',
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: CustomButtonWithIcon(
              onTap: () {
                BlocProvider.of<UserCubit>(context).getCurrentUser();
                GoRouter.of(context).push(AppRouter.homePath);
              },
              child: 'Go Dashboard',
              bgColor: const Color(0xffE9F3FF),
              textColor: Colors.blueAccent,
              icon: Symbols.swipe_up,
              onHoverColor: kBtnColor,
            ),
          ),
        ],
      ),
    );
  }
}
