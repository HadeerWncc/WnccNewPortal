import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/get_cities_cubit/get_cities_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/change_personal_info_body.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/loading/loading_change_personal_info.dart';

class ChangePersonalInfoPage extends StatelessWidget {
  const ChangePersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blueAccent,
        ),
        body: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserFailure) {
              GoRouter.of(context).go(AppRouter.loginPath);
            }
          },
          builder: (context, state) {
            if (state is UserSuccess) {
              BlocProvider.of<GetCitiesCubit>(context)
                  .getCities(state.user.government!);
              return ChangePersonalInfoBody(
                user: state.user,
                states: state.states,
                cities: state.cities,
              );
            } else if (state is UserFailure) {
              ShowSnackbar.showSnackBar(context, state.error, 'F');
            }
            return const LoadingChangePersonalInfo();
          },
        ),
      ),
    );
  }
}
