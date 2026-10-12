import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  TextEditingController subjectController = TextEditingController(text: '');
  TextEditingController descriptionController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Column(
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
          linesNum: 5,
          width: MediaQuery.of(context).size.width * .6,
          controller: descriptionController,
        ),
        // Expanded(child: AgentTable(onSelector: (dispatchers) {
        //   deletedDispatchers = dispatchers;
        //   setState(() {});
        // })),
      ],
    );
  }
}