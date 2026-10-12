import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/loading_page.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_app_bar_action.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_button_navbar.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_menus_list.dart';
import 'package:wncc_portal/features/notes/data/models/note_model/datum.dart';
import 'package:wncc_portal/features/notes/domain/entites/note_action_entity.dart';
import 'package:wncc_portal/features/notes/presentation/manager/cubites/create_new_cubit/create_new_cubit.dart';
import 'package:wncc_portal/features/notes/presentation/manager/cubites/delete_note_cubit/delete_note_cubit.dart';
import 'package:wncc_portal/features/notes/presentation/manager/cubites/note_cubit/note_cubit.dart';
import 'package:wncc_portal/features/to_do_list/presentation/views/widgets/custom_to_do_list_date.dart';
import 'package:wncc_portal/features/to_do_list/presentation/views/widgets/dotted_drop_down_button.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});
  // final UserModel user;
  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  bool addNew = false;
  TextEditingController subjectController = TextEditingController(text: '');
  TextEditingController descriptionController = TextEditingController(text: '');
  String errorMsg = '';
  @override
  Widget build(BuildContext context) {
    // final toDoProvider = Provider.of<ToDoListProvider>(context);
    // ToDoModel toDoListModel = toDoProvider.toDoList;
    List<Datum> toDoListModel = [];
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserFailure) {
          ShowSnackbar.showSnackBar(context, state.error, 'F');
          GoRouter.of(context).go(AppRouter.loginPath);
        }
      },
      builder: (context, state) {
        if (state is UserSuccess) {
          BlocProvider.of<NoteCubit>(context)
              .getNotes(state.user.id ?? '', 1, 10);
          String userId = state.user.id ?? '';

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
              body: Container(
                width: MediaQuery.of(context).size.width * 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/lined_paper.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    // ToDoListTitle(),
                    // SizedBox(height: 10),
                    CustomToDoListDate(
                      pageHeader: 'Notes',
                    ),
                    const SizedBox(height: 10),
                    BlocBuilder<NoteCubit, NoteState>(
                      builder: (context, state) {
                        if (state is NoteSuccess) {
                          toDoListModel = state.noteModel.data!.toList();
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: ListView.builder(
                                itemCount: toDoListModel.length + 1,
                                itemBuilder: (context, index) {
                                  return toDoListModel.isNotEmpty
                                      ? (index < toDoListModel.length)
                                          ? Row(
                                              children: [
                                                SizedBox(
                                                  width: 40,
                                                  child: Text(
                                                    '${index + 1} - ',
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: toDoListColor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.7,
                                                  child: TextField(
                                                    maxLines: 3,
                                                    minLines: 1,
                                                    controller:
                                                        TextEditingController(
                                                      text: toDoListModel[index]
                                                          .subject,
                                                    ),
                                                    style: const TextStyle(
                                                      decoration: false
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : TextDecoration.none,
                                                      fontSize: 18,
                                                      color: toDoListColor,
                                                    ),
                                                    onChanged: (value) {
                                                      // toDoListModel.toDoList[index] =
                                                      //     ToDoListProgress(
                                                      //   name: value,
                                                      //   isDone: toDoListModel
                                                      //       .toDoList[index].isDone,
                                                      // );

                                                      // toDoProvider.updateTask(
                                                      //   toDoListModel,
                                                      // );
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                BlocListener<DeleteNoteCubit,
                                                    DeleteNoteState>(
                                                  listener: (context, state) {
                                                    if (state
                                                        is DeleteNoteFailure) {
                                                      ShowSnackbar.showSnackBar(
                                                          context,
                                                          state.error,
                                                          'F');
                                                    } else if (state
                                                        is DeleteNoteSuccess) {
                                                      ShowSnackbar.showSnackBar(
                                                          context,
                                                          state.msg,
                                                          'S');
                                                    }
                                                  },
                                                  child: DottedDropdownButton(
                                                    onChanged: (value) {
                                                      if (value == 'View') {
                                                        GoRouter.of(context).push(
                                                            AppRouter
                                                                .noteDescriptionPage,
                                                            extra:
                                                                toDoListModel[
                                                                    index]);
                                                      }
                                                      if (value == 'Delete') {
                                                        BlocProvider.of<
                                                                    DeleteNoteCubit>(
                                                                context)
                                                            .deleteNote(
                                                                toDoListModel[
                                                                            index]
                                                                        .id ??
                                                                    '');
                                                      } else if (value ==
                                                          'Update') {
                                                        // toDoListModel.toDoList[index] =
                                                        //     ToDoListProgress(
                                                        //   name: toDoListModel
                                                        //       .toDoList[index].name,
                                                        //   isDone: true,
                                                        // );
                                                        // toDoProvider.updateTask(
                                                        //   toDoListModel,
                                                        // );
                                                      }
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )
                                          : addNew == true
                                              ? const SizedBox()
                                              : const SizedBox()
                                      : const SizedBox();
                                },
                              ),
                            ),
                          );
                        }
                        return SizedBox();
                      },
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 63, 141, 79),
                foregroundColor: const Color.fromARGB(255, 240, 254, 243),
                shape: const CircleBorder(),
                onPressed: () {
                  // addNew = true;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          children: [
                            const Text('Add Note'),
                            const SizedBox(height: 10),
                            CustomPlaceholderInput(
                              labelText: 'Subject',
                              width: MediaQuery.of(context).size.width * .6,
                              controller: subjectController,
                            ),
                            const SizedBox(height: 10),
                            CustomPlaceholderInput(
                              labelText: 'Description...',
                              linesNum: 7,
                              width: MediaQuery.of(context).size.width * .6,
                              controller: descriptionController,
                            ),
                            errorMsg != ''
                                ? Text(
                                    errorMsg,
                                    style: const TextStyle(color: Colors.red),
                                  )
                                : const SizedBox()
                            // Expanded(child: AgentTable(onSelector: (dispatchers) {
                            //   deletedDispatchers = dispatchers;
                            //   setState(() {});
                            // })),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.redAccent),
                              foregroundColor:
                                  WidgetStatePropertyAll(Colors.white),
                            ),
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            child: const Text(
                              "Discard",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          BlocConsumer<CreateNewCubit, CreateNewState>(
                            listener: (context, state) {
                              if (state is CreateNewSuccess) {
                                ShowSnackbar.showSnackBar(
                                    context, state.msg, 'S');
                                BlocProvider.of<NoteCubit>(context)
                                    .getNotes(userId, 1, 10);
                                GoRouter.of(context).pop();
                              }
                              if (state is CreateNewFailure) {
                                ShowSnackbar.showSnackBar(
                                    context, state.error, 'F');
                              }
                            },
                            builder: (context, state) {
                              if (state is CreateNewLoading) {
                                return const ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color.fromARGB(255, 241, 129, 129)),
                                    foregroundColor:
                                        WidgetStatePropertyAll(Colors.white),
                                  ),
                                  onPressed: null,
                                  child: Text(
                                    "Loading...",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }
                              return ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.redAccent),
                                  foregroundColor:
                                      WidgetStatePropertyAll(Colors.white),
                                ),
                                onPressed: () {
                                  if (subjectController.text == '' ||
                                      descriptionController.text == '') {
                                    errorMsg = 'Some fields are empity!';
                                  } else {
                                    errorMsg = '';
                                    BlocProvider.of<CreateNewCubit>(context)
                                        .addNewNote(
                                      NoteActionEntity(
                                        subject: subjectController.text,
                                        description: descriptionController.text,
                                        isPrivate: true,
                                        users: [],
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );

                  setState(() {});
                },
                child: const Icon(Icons.add_sharp, size: 30),
              ),
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
