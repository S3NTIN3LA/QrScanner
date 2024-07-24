import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _vibrationKey = 'vibracaoHabilitada';

  static Future<bool> carregarPreferenciaVibracao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_vibrationKey) ?? true;
  }

  static Future<void> salvarPreferenciaVIbracao(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_vibrationKey, value);
  }
}
