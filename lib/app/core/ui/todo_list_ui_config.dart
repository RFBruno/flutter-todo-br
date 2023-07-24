import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListUiConfig {
  TodoListUiConfig._();

  static const _primaryColor = Color(0XFF5C77CE);

  static ThemeData get theme => ThemeData(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: _primaryColor),
        textTheme: GoogleFonts.mandaliTextTheme(),
        primaryColor: _primaryColor,
        primaryColorLight: const Color(0XFFABCBF7),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _primaryColor,
          ),
        ),
        drawerTheme: const DrawerThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: const MaterialStatePropertyAll(_primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: _primaryColor
        ),

        highlightColor: Colors.transparent
        
        
      );
}
