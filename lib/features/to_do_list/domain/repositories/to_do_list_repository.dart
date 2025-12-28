import 'package:wncc_portal/features/to_do_list/data/datasources/to_do_local_data_source.dart';
import 'package:wncc_portal/features/to_do_list/data/models/to_do_model.dart';

class ToDoRepository {
  final ToDoLocalDataSource localDataSource;

  ToDoRepository({required this.localDataSource});

  Future<List<ToDoModel>> getAllToDos() async {
    return await localDataSource.getAllToDos();
  }

  Future<ToDoModel> getToDoListByDate(String date) async {
    return await localDataSource.getOrCreateToDoModel(date);
  }

  Future<void> addToDoList(ToDoModel toDoList) async {
    await localDataSource.addToDoList(toDoList);
  }

  Future<void> updateTask(ToDoModel toDoList) async {
    await localDataSource.updateToDoList(toDoList);
  }

  Future<void> deleteTask(ToDoModel toDoList) async {
    await localDataSource.deleteToDoList(toDoList);
  }
}
