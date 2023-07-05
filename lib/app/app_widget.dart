import 'package:flutter/material.dart';
import 'package:flutter_todo_br/app/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo list BR',
      home: SplashPage(),
    );
  }
}
