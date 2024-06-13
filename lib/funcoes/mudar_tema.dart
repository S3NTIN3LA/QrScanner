import 'package:flutter/material.dart';
import 'package:leitor_qrcode/styles/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeData get themeData => _themeData;

  ThemeProvider(this._themeData);

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  Future<void> carregarTema() async {
    final preferencias = await SharedPreferences.getInstance();
    final temaClaroAtivado = preferencias.getBool('temaClaro') ?? false;
    _themeData = temaClaroAtivado ? temaClaro : temaEscuro;
    notifyListeners();
  }

  Future<void> salvarTema(bool temaClaroAtivado) async {
    final preferencias = await SharedPreferences.getInstance();
    preferencias.setBool('temaClaro', temaClaroAtivado);
  }
}
