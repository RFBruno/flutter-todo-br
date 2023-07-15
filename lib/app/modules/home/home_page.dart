import 'package:flutter/material.dart';
import 'package:flutter_todo_br/app/modules/home/widgets/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      drawer: HomeDrawer(),
      body: Container(),
    );
  }
}
