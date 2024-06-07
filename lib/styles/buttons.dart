import 'package:flutter/material.dart';
import 'package:leitor_qrcode/styles/colors.dart';

class Botoes {
  static ButtonStyle botaoMenusLight = ElevatedButton.styleFrom(
      elevation: 5,
      fixedSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: MinhasCores.secundaria);

  static ButtonStyle botaoMenusDark = ElevatedButton.styleFrom(
      elevation: 5,
      fixedSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.teal[300]);
}
