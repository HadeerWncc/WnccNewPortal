import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/loading_page.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_app_bar_action.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_button_navbar.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_menus_list.dart';
import 'package:wncc_portal/features/notes/data/models/note_model/datum.dart';
import 'package:wncc_portal/features/notes/data/models/note_model/note_model.dart';
import 'package:wncc_portal/features/notes/presentation/view/widgets/note_description_body.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class NoteDescriptionPage extends StatelessWidget {
  const NoteDescriptionPage({super.key, required this.note});
  final Datum note;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserFailure) {
          ShowSnackbar.showSnackBar(context, state.error, 'F');
          GoRouter.of(context).go(AppRouter.loginPath);
        }
      },
      builder: (context, state) {
        if (state is UserSuccess) {
          // BlocProvider.of<NoteCubit>(context).getNotes(state.user.id??'', 1, 10);
          return SafeArea(
            child: Scaffold(
              backgroundColor: const Color(0xffF0F4F7),
              appBar: AppBar(
                actionsPadding: const EdgeInsets.all(5),
                title: const Text(
                  'Note',
                ),
                titleSpacing: 0.0,
                actions: [
                  CustomAppbarActions(
                    user: state.user,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              bottomNavigationBar: const CustomBottomNavBar(pageIndex: 1),
              drawer: Drawer(
                shape: drawerBorde(),
                child: CustomMenusList(user: state.user, activeTab: 'Home'),
              ),
              body: NoteDescriptionBody(note: note),

              // floatingActionButton: FloatingActionButton(
              //   backgroundColor: const Color.fromARGB(255, 63, 141, 79),
              //   foregroundColor: const Color.fromARGB(255, 240, 254, 243),
              //   shape: const CircleBorder(),
              //   onPressed: () {
              //     // addNew = true;
              //     setState(() {});
              //   },
              //   child: const Icon(Icons.add_sharp, size: 30),
              // ),
            ),
          );
        }
        return const LoadingPage(
          title: 'Note',
        );
      },
    );
  }
}
