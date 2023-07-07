import 'package:flutter_todo_br/app/core/modules/todo_list_module.dart';
import 'package:flutter_todo_br/app/modules/auth/login/login_controller.dart';
import 'package:flutter_todo_br/app/modules/auth/login/login_page.dart';
import 'package:provider/provider.dart';

class AuthModule extends TodoListModule {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (_) => LoginController(),
            )
          ],
          routes: {
            '/login': (context) => const LoginPage(),
          },
        );
}
