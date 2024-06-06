import 'package:flutter/material.dart';
import 'package:leitor_qrcode/styles/themes.dart';

class TemaProvider extends ChangeNotifier {
  ThemeData temaAtual = temaClaro;

  void alterarTema() {
    temaAtual = temaAtual == temaClaro ? temaEscuro : temaClaro;
    notifyListeners();
  }
}
