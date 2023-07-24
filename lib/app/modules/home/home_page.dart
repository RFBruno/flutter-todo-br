// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_todo_br/app/core/notifier/default_listener_notifier.dart';

import 'package:flutter_todo_br/app/core/ui/theme_extensions.dart';
import 'package:flutter_todo_br/app/core/ui/todo_list_icons.dart';
import 'package:flutter_todo_br/app/models/task_filter_enum.dart';
import 'package:flutter_todo_br/app/modules/home/home_controller.dart';
import 'package:flutter_todo_br/app/modules/home/widgets/home_drawer.dart';
import 'package:flutter_todo_br/app/modules/home/widgets/home_filters.dart';
import 'package:flutter_todo_br/app/modules/home/widgets/home_header.dart';
import 'package:flutter_todo_br/app/modules/home/widgets/home_tasks.dart';
import 'package:flutter_todo_br/app/modules/home/widgets/home_week.dart';
import 'package:flutter_todo_br/app/modules/tasks/tasks_module.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController;
  const HomePage({
    Key? key,
    required HomeController homeController,
  })  : _homeController = homeController,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    DefaultListenerNotifier(changeNotifier: widget._homeController).listener(
      context: context,
      successCallback: (notifier, listenerInstace) {
        // listenerInstace.dispose();
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget._homeController.loadTotalTasks();
      widget._homeController.findTasks(filter: TaskFilterEnum.today);
    });
    widget._homeController.loadTotalTasks();
  }

  Future<void> _goToCreateTask(BuildContext context) async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInQuad,
          );
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.bottomRight,
            child: child,
          );
        },
        pageBuilder: (
          context,
          animation,
          secondaryAnimation,
        ) {
          return TasksModule().getPage('/task/create', context);
        },
      ),
    );
    widget._homeController.refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton(
            splashRadius: 25,
            
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            icon: Icon(
              TodoListIcons.filter,
              color: context.primaryColor,
            ),
            onSelected: (value) {
              context.read<HomeController>().showOrHidefinishTask();
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: true,
                mouseCursor: MaterialStateMouseCursor.textable,
                child: Text(
                    '${context.read<HomeController>().showFinishTask ? 'Ocultar' : 'Mostrar'} tarefas concluidas'),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToCreateTask(context),
        child: const Icon(Icons.add),
      ),
      drawer: HomeDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeader(),
                      HomeFilters(),
                      HomeWeek(),
                      HomeTasks()
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
