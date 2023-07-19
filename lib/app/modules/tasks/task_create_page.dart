// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_todo_br/app/core/ui/theme_extensions.dart';
import 'package:flutter_todo_br/app/core/widget/todo_list_field.dart';

import 'package:flutter_todo_br/app/modules/tasks/task_create_controller.dart';
import 'package:flutter_todo_br/app/modules/tasks/widgets/calendar_button.dart';

class TaskCreatePage extends StatelessWidget {
  final TaskCreateController _controller;

  TaskCreatePage({
    Key? key,
    required TaskCreateController controller,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            splashRadius: 25,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              color: Colors.black,
              
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(
          'Salvar Task',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Criar Atividade',
                  style: context.titleStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TodoListField(label: ''),
              const SizedBox(height: 20),
              const CalendarButton()

            ],
          ),
        ),
      ),
    );
  }
}
