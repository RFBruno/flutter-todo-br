// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_todo_br/app/core/ui/theme_extensions.dart';
import 'package:flutter_todo_br/app/models/task_filter_enum.dart';
import 'package:flutter_todo_br/app/models/total_tasks_model.dart';
import 'package:flutter_todo_br/app/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

class TodoCardFilter extends StatefulWidget {
  final String label;
  final TaskFilterEnum taskFilterEnum;
  final TotalTasksModel? totalTasksModel;
  final bool selected;

  const TodoCardFilter({
    Key? key,
    required this.label,
    required this.taskFilterEnum,
    required this.selected,
    this.totalTasksModel,
  }) : super(key: key);

  double _getPercentFinish() {
    var total = totalTasksModel?.totalTasks ?? 0.1;
    if (total == 0) total = 0.1;
    final totalFinish = totalTasksModel?.totalTasksFinish ?? 0;
    final result = (totalFinish / total);
    return result;
  }

  int _getTotalTasksPedenting() {
    var totalTasks = totalTasksModel?.totalTasks ?? 0;
    var tasksFinished = totalTasksModel?.totalTasksFinish ?? 0;
    return totalTasks - tasksFinished;
  }

  @override
  State<TodoCardFilter> createState() => _TodoCardFilterState();
}

class _TodoCardFilterState extends State<TodoCardFilter> {
  final date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context
          .read<HomeController>()
          .findTasks(filter: widget.taskFilterEnum),
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 120,
          maxWidth: 150,
        ),
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: widget.selected ? context.primaryColor : Colors.white,
            border: Border.all(
              width: 1,
              color: Colors.grey.withOpacity(.8),
            ),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget._getTotalTasksPedenting()} TASKS',
              style: context.titleStyle.copyWith(
                fontSize: 10,
                color: widget.selected ? Colors.white : Colors.grey,
              ),
            ),
            Text(
              widget.label,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: widget.selected ? Colors.white : Colors.black),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween(
                begin: 0.0,
                end: widget._getPercentFinish(),
              ),
              duration: const Duration(seconds: 1),
              builder: (context, value, child) {
                return LinearProgressIndicator(
                    backgroundColor: widget.selected
                        ? context.primaryColorLight
                        : Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      widget.selected ? Colors.white : context.primaryColor,
                    ),
                    value: value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
