import 'package:flutter/material.dart';
import 'package:flutter_todo_br/app/app_widget.dart';
import 'package:flutter_todo_br/app/core/database/sqlite_connection_factory.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => SqliteConnectionFactory(),
          lazy: false,
        ),
      ],
      child: const AppWidget(),
    );
  }
}
