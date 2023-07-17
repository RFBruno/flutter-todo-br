import 'package:flutter/material.dart';
import 'package:flutter_todo_br/app/core/ui/theme_extensions.dart';
import 'package:flutter_todo_br/app/modules/home/widgets/task.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text('TAKS\'S DE HOJE', style: context.titleStyle,),
          Column(
            children: [
              Task(),
              Task(),
              Task(),
              Task(),
              Task(),
              Task(),
              Task(),
              Task(),
              Task(),
              Task(),
              Task(),
            ],
          )
        ],
      ),
    );
  }
}
