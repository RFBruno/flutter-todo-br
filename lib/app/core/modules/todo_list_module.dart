// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_todo_br/app/core/modules/todo_list_page.dart';
import 'package:provider/single_child_widget.dart';

abstract class TodoListModule {
  final Map<String, WidgetBuilder> _routes;
  final List<SingleChildWidget>? _bindings;

  TodoListModule({
    List<SingleChildWidget>? bindings,
    required Map<String, WidgetBuilder> routes,
  })  : _routes = routes,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _routes.map(
      (key, pageBuilder) => MapEntry(
        key,
        (_) => TodoListPage(
          bindings: _bindings,
          page: pageBuilder,
        ),
      ),
    );
  }

  Widget getPage(String path, BuildContext context) {
    final widgetBuilder = _routes[path];

    if (widgetBuilder != null) {
      return TodoListPage(
        page: widgetBuilder,
        bindings: _bindings,
      );
    }

    throw Exception();
  }
}
