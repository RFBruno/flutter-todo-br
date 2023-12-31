
import 'package:flutter_todo_br/app/models/task_model.dart';

abstract class TasksRepository {
  Future<void> save(DateTime date, String description);
  Future <List<TaskModel>> findByPeriod(DateTime start, DateTime end);
  Future<void> checkOrUncheck(TaskModel task);
  Future<void>  deleteById(int id);
  Future<void>  cleanDb();
}