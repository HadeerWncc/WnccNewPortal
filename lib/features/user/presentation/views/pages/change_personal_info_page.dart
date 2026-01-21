import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/fields/loading_input.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/form_heading.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/get_cities_cubit/get_cities_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/change_personal_info_body.dart';

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
            if (state is UserFailure) {GoRouter.of(context).go(AppRouter.loginPath);}
          },
          builder: (context, state) {
            if (state is UserSuccess) {
              BlocProvider.of<GetCitiesCubit>(context)
                  .getCities(state.user.state!);
              return ChangePersonalInfoBody(
                user: state.user,
                states: state.states,
                cities: state.cities,
              );
            } else if (state is UserFailure) {
              ShowSnackbar.showSnackBar(context, state.error, 'F');
            }
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                enabled: true,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const FormHeading(
                        title: 'Personal Information',
                        subTitle: 'Change your personal information',
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width * .3,
                        height: MediaQuery.of(context).size.width * .3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      const LoadingInput(),
                      const SizedBox(height: 20),
                      const LoadingInput(),
                      const SizedBox(height: 20),
                      const LoadingInput(),
                      const SizedBox(height: 20),
                      const LoadingInput(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
