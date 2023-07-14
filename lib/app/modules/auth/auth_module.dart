import 'package:flutter_todo_br/app/core/modules/todo_list_module.dart';
import 'package:flutter_todo_br/app/modules/auth/login/login_controller.dart';
import 'package:flutter_todo_br/app/modules/auth/login/login_page.dart';
import 'package:flutter_todo_br/app/modules/auth/register/register_controller.dart';
import 'package:flutter_todo_br/app/modules/auth/register/register_page.dart';
import 'package:provider/provider.dart';

class AuthModule extends TodoListModule {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => LoginController(userService: context.read()),
            ),
            ChangeNotifierProvider(
              create: (context) => RegisterController(userService: context.read()),
            ),
          ],
          routes: {
            '/login': (context) => const LoginPage(),
            '/register': (context) => RegisterPage(),
          },
        );
}
