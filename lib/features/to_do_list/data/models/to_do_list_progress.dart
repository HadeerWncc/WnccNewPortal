import 'package:hive/hive.dart';

part 'to_do_list_progress.g.dart';

@HiveType(typeId: 3) // غيري الرقم لو مستخدم قبل كده
class ToDoListProgress {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool isDone;

  ToDoListProgress({
    required this.name,
    required this.isDone,
  });
}
