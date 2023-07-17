import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            value: true,
            onChanged: (value) {},
          ),
          title: const Text(
            'Descrição da task',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          subtitle: const Text(
            '10/07/2023',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
