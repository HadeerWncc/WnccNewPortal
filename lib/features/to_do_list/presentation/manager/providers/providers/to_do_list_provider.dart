import 'package:flutter/material.dart';
import 'package:wncc_portal/features/to_do_list/data/models/to_do_model.dart';
import 'package:wncc_portal/features/to_do_list/domain/repositories/to_do_list_repository.dart';

class ToDoListProvider extends ChangeNotifier {
  final ToDoRepository repository;

  ToDoListProvider({required this.repository}) {
    loadToDoList(
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
    );
  }
  List<ToDoModel> _tasks = [];
  List<ToDoModel> get tasks => _tasks;
  ToDoModel _toDoList = ToDoModel(
    index: DateTime.now().microsecondsSinceEpoch,
    date:
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
    toDoList: [],
    isDone: false,
  );
  ToDoModel get toDoList => _toDoList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getAllToDoList() async {
    _isLoading = true;
    notifyListeners();
    _tasks = await repository.getAllToDos();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadToDoList(String date) async {
    _isLoading = true;
    notifyListeners();
    _toDoList = await repository.getToDoListByDate(date);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addToDoList(ToDoModel toDoList) async {
    await repository.addToDoList(toDoList);
    _tasks.add(toDoList);
    notifyListeners();
  }

  Future<void> updateTask(ToDoModel task) async {
    await repository.updateTask(task);
    int index = _tasks.indexWhere((t) => t == task);
    if (index != -1) {
      _tasks[index] = task;
      notifyListeners();
    }
  }

  Future<void> deleteTask(ToDoModel task) async {
    await repository.deleteTask(task);
    _tasks.removeWhere((t) => t == task);
    notifyListeners();
  }
}
