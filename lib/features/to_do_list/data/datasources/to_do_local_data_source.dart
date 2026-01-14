import 'package:hive/hive.dart';
import 'package:wncc_portal/features/to_do_list/data/models/to_do_model.dart';

class ToDoLocalDataSource {
  static const String _boxName = 'toDoDailyList';

  Box<ToDoModel> get box => Hive.box<ToDoModel>(_boxName);

  Future<List<ToDoModel>> getAllToDos() async {
    return box.values.toList();
  }

  Future<ToDoModel> getOrCreateToDoModel(String date) async {
    for (var item in box.values) {
      if (item.date == date) return item;
    }

    final newModel = ToDoModel(
      index: DateTime.now().microsecond,
      date: date,
      toDoList: [],
      isDone: false,
    );

    await box.add(newModel);
    return newModel;
  }

  Future<void> addToDoList(ToDoModel toDoList) async {
    await box.add(toDoList);
  }

  Future<void> updateToDoList(ToDoModel toDoList) async {
    if (toDoList.key == null) {
      await box.add(toDoList);
    } else {
      await box.put(toDoList.key, toDoList);
    }
  }

  Future<void> deleteToDoList(ToDoModel toDoList) async {
    if (toDoList.key != null) {
      await box.delete(toDoList.key);
    }
  }
}
