import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_todo_br/app/core/auth/auth_provider.dart';
import 'package:flutter_todo_br/app/core/ui/messages.dart';
import 'package:flutter_todo_br/app/core/ui/theme_extensions.dart';
import 'package:flutter_todo_br/app/modules/home/home_controller.dart';
import 'package:flutter_todo_br/app/services/user/user_service.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  final nameVN = ValueNotifier<String>('');

  HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.primaryColor.withAlpha(70),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
            ),
            child: Row(
              children: [
                Selector<AuthProvider, ImageProvider>(
                  selector: (context, authProvider) {
                    if(authProvider.user?.photoURL != null){
                      return NetworkImage(authProvider.user!.photoURL!);
                    }else{
                      return const AssetImage('assets/dash.jpg');
                    }
                  },
                  builder: (_, imageValue, __) {
                    return CircleAvatar(
                      backgroundImage: imageValue,
                      radius: 30,
                    );
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Selector<AuthProvider, String>(
                      selector: (context, authProvider) {
                        return authProvider.user?.displayName ?? 'Usuário';
                      },
                      builder: (_, value, __) {
                        return Text(
                          value,
                          style: context.textTheme.titleLarge,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('Alterar Nome'),
                    content: TextField(
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        isDense: true,
                      ),
                      onChanged: (value) => nameVN.value = value,
                    ),
                    actions: [
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.red.shade300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.red.shade300),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () async {
                          final nameValue = nameVN.value;
                          if (nameValue.isEmpty) {
                            Messages.of(context).showError('Nome obrigatório');
                          } else {
                            Loader.show(
                              context,
                              themeData: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.fromSwatch()
                                    .copyWith(primary: context.primaryColor),
                              ),
                            );
                            await context
                                .read<UserService>()
                                .updateDisplayName(nameValue);
                            Loader.hide();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Alterar'),
                      ),
                    ],
                  );
                },
              );
            },
            title: const Text('Alterar nome'),
          ),
          ListTile(
            onTap: () {
              context.read<AuthProvider>().logout();
              context.read<HomeController>().cleanDb();
            },
            title: const Text('Sair'),
          ),
        ],
      ),
    );
  }
}
