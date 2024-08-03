import 'package:flutter/material.dart';
import 'package:leitor_qrcode/funcoes/mudar_tema.dart';
import 'package:leitor_qrcode/funcoes/vibration_provider.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:leitor_qrcode/styles/themes.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vibration/vibration.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({super.key});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

void _compartilhar(BuildContext context, String url) {
  Share.share(url);
}

class _ConfiguracoesState extends State<Configuracoes> {
  //bool abrirLinks = false;
  String linkCompartilhar =
      'https://play.google.com/store/apps/details?id=com.qrscanner.appbr';
  @override
  Widget build(BuildContext context) {
    final temaProvider = Provider.of<ThemeProvider>(context);
    bool temaClaroAtivado = temaProvider.themeData == temaClaro;
    final vibracaoProvider = context.watch<VibrationProvider>();
    final vibrationOn = vibracaoProvider.vibracaoOn;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.settings_applications_sharp,
        ),
        title: const Text(
          'Configurações',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Configurações do app',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: temaClaroAtivado
                      ? MinhasCores.secundaria
                      : Colors.teal[300],
                ),
              ),
            ),
            ListTile(
              leading: Icon(temaClaroAtivado
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined),
              title: Text(temaClaroAtivado ? 'Tema claro' : 'Tema escuro'),
              trailing: Switch(
                activeColor: Colors.amber[300],
                activeTrackColor: Colors.blue[200],
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.blue[800],
                trackOutlineColor: WidgetStatePropertyAll(
                    temaClaroAtivado ? Colors.blue[200] : Colors.blue[800]),
                value: temaClaroAtivado,
                onChanged: (value) {
                  if (vibrationOn) {
                    Vibration.vibrate(duration: 50);
                  }
                  ThemeData novoTema = value ? temaClaro : temaEscuro;
                  temaProvider.setTheme(novoTema);
                  temaProvider.salvarTema(value);
                },
              ),
            ),
            /*ListTile(
              leading: Icon(
                abrirLinks ? Icons.link : Icons.link_off,
              ),
              title: const Text(
                'Abrir links automaticamente',
              ),
              trailing: Switch(
                inactiveTrackColor: MinhasCores.primaria,
                value: abrirLinks,
                onChanged: (value) {
                  Vibration.vibrate(duration: 50);
                  setState(() {
                    abrirLinks = !abrirLinks;
                  });
                },
              ),
            ),*/
            ListTile(
              leading: Icon(
                vibrationOn ? Icons.vibration : Icons.smartphone,
              ),
              title: const Text(
                'Vibrar',
              ),
              trailing: Switch(
                inactiveTrackColor: MinhasCores.primaria,
                value: vibrationOn,
                onChanged: (value) {
                  if (vibrationOn) {
                    Vibration.vibrate(duration: 50);
                  }
                  vibracaoProvider.setarPreferenciaVibracao(value);
                },
              ),
            ),
            ListTile(
              title: Text(
                'Sobre',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: temaClaroAtivado
                      ? MinhasCores.secundaria
                      : Colors.teal[300],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline,
              ),
              title: const Text(
                'Introdução',
              ),
              onTap: () {
                if (vibrationOn) {
                  Vibration.vibrate(duration: 50);
                }
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.share_outlined,
              ),
              title: const Text(
                'Compartilhar app',
              ),
              onTap: () {
                if (vibrationOn) {
                  Vibration.vibrate(duration: 50);
                }
                _compartilhar(context, linkCompartilhar);
              },
            ),
            const ListTile(
              leading: Icon(
                Icons.system_update,
              ),
              title: Text(
                'Versão',
              ),
              subtitle: Text(
                '1.0.0',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
