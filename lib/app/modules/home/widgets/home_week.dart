import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_br/app/core/ui/theme_extensions.dart';

class HomeWeek extends StatelessWidget {
  const HomeWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text('DIA DA SEMANA'),
        const SizedBox(height: 10),
        SizedBox(
          height: 95,
          child: DatePicker(
            DateTime.now(),
            height: 2,
            daysCount: 7,
            locale: 'pt_BR',
            monthTextStyle: const TextStyle(fontSize: 8),
            dateTextStyle: const TextStyle(fontSize: 13),
            dayTextStyle: const TextStyle(fontSize: 13),
            selectionColor: context.primaryColor,
            selectedTextColor: Colors.white,
        
          ),
        )
      ],
    );
  }
}