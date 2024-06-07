import 'package:flutter/material.dart';
import 'package:leitor_qrcode/styles/colors.dart';

final ThemeData temaClaro = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    titleSmall: TextStyle(color: Colors.black),
    titleMedium: TextStyle(
      color: MinhasCores.secundaria,
      fontWeight: FontWeight.bold,
    ),
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
);

final ThemeData temaEscuro = ThemeData(
  brightness: Brightness.dark,
  textTheme: TextTheme(
    titleSmall: const TextStyle(color: MinhasCores.primaria),
    titleMedium: TextStyle(
      color: Colors.teal[300],
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: const IconThemeData(color: MinhasCores.primaria),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(backgroundColor: MinhasCores.terciaria),
  scaffoldBackgroundColor: MinhasCores.terciaria,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: MinhasCores.terciaria,
    selectedItemColor: Colors.teal[300],
  ),
);
