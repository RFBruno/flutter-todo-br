import 'package:flutter/material.dart';
import 'package:flutter_todo_br/app/core/ui/theme_extensions.dart';
import 'package:flutter_todo_br/app/models/task_filter_enum.dart';
import 'package:flutter_todo_br/app/models/task_model.dart';
import 'package:flutter_todo_br/app/modules/home/home_controller.dart';
import 'package:flutter_todo_br/app/modules/home/widgets/task.dart';
import 'package:provider/provider.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Selector<HomeController, String>(
            selector: (context, controller) {
              return controller.filterSelected.description;
            },
            builder: (context, value, child) {
              return Text(
                'TAKS\'S $value',
                style: context.titleStyle,
              );
            },
          ),
          Column(
            children: context
                .select<HomeController, List<TaskModel>>(
                    (controller) => controller.filteredTasks)
                .map(
                  (t) => Task(task: t),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
