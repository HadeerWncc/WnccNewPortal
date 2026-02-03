import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/loading_page.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_app_bar_action.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_button_navbar.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_menus_list.dart';
import 'package:wncc_portal/features/home/to_do_list/presentation/views/widgets/custom_to_do_list_date.dart';
import 'package:wncc_portal/features/home/to_do_list/presentation/views/widgets/dotted_drop_down_button.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  bool addNew = false;
  @override
  Widget build(BuildContext context) {
    // final toDoProvider = Provider.of<ToDoListProvider>(context);
    // ToDoModel toDoListModel = toDoProvider.toDoList;
    List<String> toDoListModel = [];
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserFailure) {
          ShowSnackbar.showSnackBar(context, state.error, 'F');
          GoRouter.of(context).go(AppRouter.loginPath);
        }
      },
      builder: (context, state) {
        if (state is UserSuccess) {
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
                    const CustomToDoListDate(),
                    const SizedBox(height: 10),
                    Expanded(
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
                                              controller: TextEditingController(
                                                text: toDoListModel[index],
                                              ),
                                              style: const TextStyle(
                                                decoration: false
                                                    ? TextDecoration.lineThrough
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
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          DottedDropdownButton(
                                            onChanged: (value) {
                                              if (value == 'Delete') {
                                                // toDoListModel.toDoList.removeAt(
                                                //   index,
                                                // );
                                                // toDoProvider.updateTask(
                                                //   toDoListModel,
                                                // );
                                              } else if (value == 'Done') {
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
                                        ],
                                      )
                                    : addNew == true
                                        ? const SizedBox()
                                        : const SizedBox()
                                : const SizedBox();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 63, 141, 79),
                foregroundColor: const Color.fromARGB(255, 240, 254, 243),
                shape: const CircleBorder(),
                onPressed: () {
                  addNew = true;
                  setState(() {});
                },
                child: const Icon(Icons.add_sharp, size: 30),
              ),
            ),
          );
        }
        return const LoadingPage(
          title: 'ToDoList',
        );
      },
    );
  }
}
