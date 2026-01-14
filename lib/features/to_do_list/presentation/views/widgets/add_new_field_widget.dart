import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/to_do_list/data/models/to_do_list_progress.dart';
import 'package:wncc_portal/features/to_do_list/data/models/to_do_model.dart';
import 'package:wncc_portal/features/to_do_list/presentation/manager/providers/providers/to_do_list_provider.dart';

class AddNewFieldWidget extends StatelessWidget {
  const AddNewFieldWidget({
    super.key,
    required this.index,
    required this.toDoListModel,
    required this.toDoProvider,
  });
  final int index;
  final ToDoModel toDoListModel;
  final ToDoListProvider toDoProvider;
  @override
  Widget build(BuildContext context) {
    return Row(
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
          width: MediaQuery.of(context).size.width * 0.7,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            style: const TextStyle(
              fontSize: 18,
              color: toDoListColor,
            ),
            onChanged: (value) {
              if (index == toDoListModel.toDoList.length) {
                toDoListModel.toDoList.add(
                  ToDoListProgress(name: value, isDone: false),
                );
              } else {
                toDoListModel.toDoList[index] = ToDoListProgress(
                  name: value,
                  isDone: false,
                );
              }
              toDoProvider.updateTask(toDoListModel);
            },
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}
