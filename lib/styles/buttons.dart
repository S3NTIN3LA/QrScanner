import 'package:flutter/material.dart';
import 'package:leitor_qrcode/styles/colors.dart';

class Botoes {
  static ButtonStyle botaoMenus = ElevatedButton.styleFrom(
      elevation: 5,
      fixedSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: MinhasCores.secundaria);
}
