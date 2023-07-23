import 'package:flutter/material.dart';
import 'package:flutter_todo_br/app/core/auth/auth_provider.dart';
import 'package:flutter_todo_br/app/core/ui/theme_extensions.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Selector<AuthProvider, String>(
        builder: (_, value, __) {
          return Text(
            'E ai, $value!',
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          );
        },
        selector: (context, authProvider) =>
            authProvider.user?.displayName ?? 'user',
      ),
    );
  }
}
