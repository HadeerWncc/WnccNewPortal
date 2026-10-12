import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/notes/data/models/note_model/datum.dart';
import 'package:wncc_portal/features/to_do_list/presentation/views/widgets/custom_to_do_list_date.dart';

class NoteDescriptionBody extends StatelessWidget {
  const NoteDescriptionBody({super.key, required this.note});
  final Datum note;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          const SizedBox(height: 10),
          CustomToDoListDate(
            pageHeader: note.subject ?? '',
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: SizedBox(
                // width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  maxLines: 3,
                  minLines: 1,
                  controller: TextEditingController(
                    text: note.description,
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
            ),
          ),
        ],
      ),
    );
  }
}
