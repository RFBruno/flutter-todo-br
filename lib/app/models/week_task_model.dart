// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_todo_br/app/models/task_model.dart';

class WeekTaskModel {
  final DateTime startDate;
  final DateTime endDate;
  final List<TaskModel> tasks;
  
  WeekTaskModel({
    required this.startDate,
    required this.endDate,
    required this.tasks,
  });
}
