
import 'package:hive/hive.dart';
import 'package:wncc_portal/features/to_do_list/data/models/to_do_list_progress.dart';

part 'to_do_model.g.dart';

@HiveType(typeId: 2)
class ToDoModel extends HiveObject {
  @HiveField(0)
  int index;

  @HiveField(1)
  String date;

  @HiveField(2)
  List<ToDoListProgress> toDoList;

  @HiveField(3)
  bool isDone;

  ToDoModel({
    required this.index,
    required this.date,
    required this.toDoList,
    required this.isDone,
  });
}