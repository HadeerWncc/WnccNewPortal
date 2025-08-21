import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/loading_page.dart';
import 'package:wncc_portal/features/complains/presentation/managers/cubits/complain_details_cubit/complain_details_cubit.dart';
import 'package:wncc_portal/features/complains/presentation/views/widgets/complain_details_body.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_app_bar_action.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_menus_list.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class ComplainDetailsPage extends StatelessWidget {
  const ComplainDetailsPage(
      {super.key, required this.complainId, required this.user});

  final String complainId;
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ComplainDetailsCubit>(context).openComplain(complainId);

    return SafeArea(
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return Scaffold(
              appBar: AppBar(
                actionsPadding: const EdgeInsets.all(5),
                title: const Text('Complains'),
                actions: [
                  CustomAppbarActions(
                    user: state.user,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              drawer: Drawer(
                shape: drawerBorde(),
                child: CustomMenusList(
                  activeTab: "Complains",
                  user: state.user,
                ),
              ),
              body: BlocConsumer<ComplainDetailsCubit, ComplainDetailsState>(
                listener: (context, state) {
                  // if (state is RequestChangeLogSuccess) {
                  //   ShowSnackbar.showSnackBar(context, state.msg, 'S');
                  // } else if (state is RequestChangeLogFailure) {
                  //   BlocProvider.of<RequestDetailsCubit>(context)
                  //       .openRequest(complainId);

                  //   ShowSnackbar.showSnackBar(context, state.error, 'F');
                  // }
                },
                builder: (context, state) {
                  if (state is ComplainDetailsSuccess) {
                    return ComplainDetailsBody(
                      user: user,
                      complain: state.complain,
                    );
                  } 
                  // else if (state is RequestChangeLogSuccess) {
                  //   return RequestDetailsBody(
                  //     user: user,
                  //     requestDetailsEntity: state.requestDetails,
                  //   );
                  // }
                   else if (state is ComplainDetailsFailure) {
                    return Text(state.error);
                  }
                  return const CircularProgressIndicator();
                },
              ),
            );
          } else if (state is UserFailure) {
            return Center(
              child: Text(state.error),
            );
          }
          return const LoadingPage(
            title: 'Complains',
          );
        },
      ),
    );
  }
}
