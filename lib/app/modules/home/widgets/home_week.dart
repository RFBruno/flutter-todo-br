import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_br/app/core/ui/theme_extensions.dart';
import 'package:flutter_todo_br/app/models/task_filter_enum.dart';
import 'package:flutter_todo_br/app/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomeWeek extends StatelessWidget {
  const HomeWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.select<HomeController, bool>(
          (controller) => controller.filterSelected == TaskFilterEnum.week),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text('DIA DA SEMANA'),
          const SizedBox(height: 10),
          SizedBox(
            height: 95,
            child: Selector<HomeController, DateTime>(
              builder: (_, value, __) {
                return DatePicker(
                  value,
                  height: 2,
                  initialSelectedDate: value,
                  daysCount: 7,
                  locale: 'pt_BR',
                  monthTextStyle: const TextStyle(fontSize: 8),
                  dateTextStyle: const TextStyle(fontSize: 13),
                  dayTextStyle: const TextStyle(fontSize: 13),
                  selectionColor: context.primaryColor,
                  selectedTextColor: Colors.white,
                  onDateChange: context.read<HomeController>().filterByDay,
                );
              },
              selector: (context, controller) => controller.initialDateOfWeek ?? DateTime.now(),
            ),
          ),
        ],
      ),
    );
  }
}
