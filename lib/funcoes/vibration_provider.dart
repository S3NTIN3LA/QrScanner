import 'package:flutter/material.dart';
import 'package:leitor_qrcode/funcoes/alterar_vibracao.dart';

class VibrationProvider with ChangeNotifier {
  bool _vibrationOn = true;

  bool get vibracaoOn => _vibrationOn;

  VibrationProvider() {
    _carregarPreferenciaVibracao();
  }

  void _carregarPreferenciaVibracao() async {
    _vibrationOn = await PreferencesService.carregarPreferenciaVibracao();
    notifyListeners();
  }

  void setarPreferenciaVibracao(bool value) async {
    _vibrationOn = value;
    await PreferencesService.salvarPreferenciaVIbracao(value);
    notifyListeners();
  }
}
