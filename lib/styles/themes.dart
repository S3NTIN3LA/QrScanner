import 'package:flutter/material.dart';
import 'package:leitor_qrcode/styles/colors.dart';

final ThemeData temaClaro = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  cardTheme: const CardTheme(color: MinhasCores.secundaria),
  textTheme: const TextTheme(
    titleSmall: TextStyle(color: Colors.black),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  appBarTheme: const AppBarTheme(backgroundColor: MinhasCores.primaria),
  scaffoldBackgroundColor: MinhasCores.primaria,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: MinhasCores.secundaria,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MinhasCores.primaria,
      selectedItemColor: MinhasCores.secundaria),
  switchTheme: SwitchThemeData(
    trackColor: WidgetStatePropertyAll(
      Colors.teal.shade300,
    ),
    thumbColor: const WidgetStatePropertyAll(MinhasCores.secundaria),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: MinhasCores.secundaria, width: 2),
    ),
  ),
);

final ThemeData temaEscuro = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  cardTheme: CardTheme(color: Colors.teal[300]),
  textTheme: const TextTheme(
    titleSmall: TextStyle(color: MinhasCores.primaria),
  ),
  iconTheme: const IconThemeData(color: MinhasCores.primaria),
  buttonTheme: ButtonThemeData(buttonColor: Colors.teal[300]),
  appBarTheme: const AppBarTheme(backgroundColor: MinhasCores.terciaria),
  scaffoldBackgroundColor: MinhasCores.terciaria,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal[300],
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: MinhasCores.terciaria,
    selectedItemColor: Colors.teal[300],
  ),
  switchTheme: SwitchThemeData(
    trackColor: const WidgetStatePropertyAll(
      MinhasCores.secundaria,
    ),
    thumbColor: WidgetStatePropertyAll(Colors.teal[300]),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.teal.shade300, width: 2),
    ),
  ),
);
