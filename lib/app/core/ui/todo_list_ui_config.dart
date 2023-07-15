import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListUiConfig {
  TodoListUiConfig._();

  static ThemeData get theme => ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: const Color(0XFF5C77CE)),
        textTheme: GoogleFonts.mandaliTextTheme(),
        primaryColor: const Color(0XFF5C77CE),
        primaryColorLight: const Color(0XFFABCBF7),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0XFF5C77CE),
          ),
        ),
        drawerTheme:  const DrawerThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
              ),
          ),
        ),
      );
}
