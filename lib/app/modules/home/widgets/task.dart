// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_todo_br/app/modules/home/home_controller.dart';
import 'package:intl/intl.dart';
import 'package:flutter_todo_br/app/models/task_model.dart';
import 'package:provider/provider.dart';

class Task extends StatelessWidget {
  final TaskModel task;
  final dateFormat = DateFormat('dd/MM/y');
  Task({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<int>(task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.red.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Padding(
          padding: EdgeInsets.only(right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'DELETAR',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.delete_outline_rounded,
                size: 30,
              ),
            ],
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        final response = await _confirmDialog(context);
        return response;
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: Colors.grey.shade300,
          ),
          boxShadow: const [
            BoxShadow(color: Colors.grey),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: IntrinsicHeight(
          child: ListTile(
            contentPadding: const EdgeInsets.all(5),
            leading: Checkbox(
              value: task.finished,
              onChanged: (value) =>
                  context.read<HomeController>().checkOrUncheck(task),
            ),
            title: Text(
              task.description,
              style: TextStyle(
                decoration: task.finished ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(
              dateFormat.format(task.dateTime),
              style: TextStyle(
                decoration: task.finished ? TextDecoration.lineThrough : null,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _confirmDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Center(
            child: Icon(
              Icons.warning_amber_rounded,
              size: 60,
              color: Colors.red.shade300,
            ),
          ),
          content: const Text('Tem certeza que deseja apagar essa task?'),
          actions: [
            TextButton(
              onPressed: () {
                context.read<HomeController>().deleteTaskById(task.id);
                Navigator.pop(context, true);
              },
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red.shade300,
              ),
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
