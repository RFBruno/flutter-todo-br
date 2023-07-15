import 'package:flutter/material.dart';
import 'package:flutter_todo_br/app/core/modules/todo_list_module.dart';
import 'package:flutter_todo_br/app/modules/home/home_page.dart';

class HomeModule extends  TodoListModule{
  
  HomeModule(): super(
    bindings: null,
    routes: {
      '/home': (context) => const HomePage()
    }
  );

}