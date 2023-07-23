
import 'package:flutter_todo_br/app/models/task_model.dart';
import 'package:flutter_todo_br/app/models/week_task_model.dart';

abstract class TasksService {
  Future<void> save(DateTime date, String description);
  Future<List<TaskModel>> getToday();
  Future<List<TaskModel>> getTomorrow();
  Future<WeekTaskModel> getWeek();
  Future<void> checkOrUncheck(TaskModel task);
  Future<void>  deleteById(int id);
  Future<void>  cleanDb();
}
