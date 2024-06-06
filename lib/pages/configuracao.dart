import 'package:flutter/material.dart';
import 'package:leitor_qrcode/fun%C3%A7%C3%B5es/mudar_tema.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:leitor_qrcode/styles/themes.dart';
import 'package:vibration/vibration.dart';
import 'package:provider/provider.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({super.key});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  bool vibrar = true;
  bool abrirLinks = false;
  bool botaoTemas = true;
  @override
  Widget build(BuildContext context) {
    final temaProvider = Provider.of<TemaProvider>(context);
    return Scaffold(
      backgroundColor: temaProvider.temaAtual.brightness == Brightness.light
          ? MinhasCores.primaria
          : temaEscuro.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: temaProvider.temaAtual.brightness == Brightness.light
            ? temaClaro.appBarTheme.backgroundColor
            : temaEscuro.appBarTheme.backgroundColor,
        leading: Icon(
          Icons.settings_applications_sharp,
          color: temaProvider.temaAtual.brightness == Brightness.light
              ? MinhasCores.secundaria
              : Colors.teal[300],
        ),
        title: Text('Configurações',
            style: temaProvider.temaAtual.brightness == Brightness.light
                ? temaClaro.textTheme.titleSmall
                : temaEscuro.textTheme.titleSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Configurações do app',
                style: temaProvider.temaAtual.brightness == Brightness.light
                    ? temaClaro.textTheme.titleMedium
                    : temaEscuro.textTheme.titleMedium,
              ),
            ),
            ListTile(
              leading: Icon(
                  temaProvider.temaAtual.brightness == Brightness.light
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                  color: temaProvider.temaAtual.brightness == Brightness.light
                      ? temaClaro.iconTheme.color
                      : temaEscuro.iconTheme.color),
              title: Text(
                  temaProvider.temaAtual.brightness == Brightness.light
                      ? 'Tema claro'
                      : 'Tema escuro',
                  style: temaProvider.temaAtual.brightness == Brightness.light
                      ? temaClaro.textTheme.titleSmall
                      : temaEscuro.textTheme.titleSmall),
              trailing: Switch(
                activeColor: Colors.amber[300],
                activeTrackColor: Colors.blue[200],
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.blue[800],
                value: botaoTemas,
                onChanged: (value) {
                  Vibration.vibrate(duration: 50);
                  temaProvider.alterarTema();
                  setState(() {
                    botaoTemas = !botaoTemas;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(abrirLinks ? Icons.link : Icons.link_off,
                  color: temaProvider.temaAtual.brightness == Brightness.light
                      ? temaClaro.iconTheme.color
                      : temaEscuro.iconTheme.color),
              title: Text('Abrir links automaticamente',
                  style: temaProvider.temaAtual.brightness == Brightness.light
                      ? temaClaro.textTheme.titleSmall
                      : temaEscuro.textTheme.titleSmall),
              trailing: Switch(
                activeColor: MinhasCores.secundaria,
                inactiveTrackColor: MinhasCores.primaria,
                value: abrirLinks,
                onChanged: (value) {
                  Vibration.vibrate(duration: 50);
                  setState(() {
                    abrirLinks = !abrirLinks;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(vibrar ? Icons.vibration : Icons.smartphone,
                  color: temaProvider.temaAtual.brightness == Brightness.light
                      ? temaClaro.iconTheme.color
                      : temaEscuro.iconTheme.color),
              title: Text('Vibrar',
                  style: temaProvider.temaAtual.brightness == Brightness.light
                      ? temaClaro.textTheme.titleSmall
                      : temaEscuro.textTheme.titleSmall),
              trailing: Switch(
                activeColor: MinhasCores.secundaria,
                inactiveTrackColor: MinhasCores.primaria,
                value: vibrar,
                onChanged: (value) {
                  Vibration.vibrate(duration: 50);
                  setState(() {
                    vibrar = !vibrar;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                'Sobre',
                style: temaProvider.temaAtual.brightness == Brightness.light
                    ? temaClaro.textTheme.titleMedium
                    : temaEscuro.textTheme.titleMedium,
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_outline,
                  color: temaProvider.temaAtual.brightness == Brightness.light
                      ? temaClaro.iconTheme.color
                      : temaEscuro.iconTheme.color),
              title: Text('Introdução',
                  style: temaProvider.temaAtual.brightness == Brightness.light
                      ? temaClaro.textTheme.titleSmall
                      : temaEscuro.textTheme.titleSmall),
              onTap: () {
                Vibration.vibrate(duration: 50);
              },
            ),
            ListTile(
              leading: Icon(Icons.star_border,
                  color: temaProvider.temaAtual.brightness == Brightness.light
                      ? temaClaro.iconTheme.color
                      : temaEscuro.iconTheme.color),
              title: Text('Avalie-nos',
                  style: temaProvider.temaAtual.brightness == Brightness.light
                      ? temaClaro.textTheme.titleSmall
                      : temaEscuro.textTheme.titleSmall),
              onTap: () {
                Vibration.vibrate(duration: 50);
              },
            ),
            ListTile(
              leading: Icon(Icons.system_update,
                  color: temaProvider.temaAtual.brightness == Brightness.light
                      ? temaClaro.iconTheme.color
                      : temaEscuro.iconTheme.color),
              title: Text('Versão',
                  style: temaProvider.temaAtual.brightness == Brightness.light
                      ? temaClaro.textTheme.titleSmall
                      : temaEscuro.textTheme.titleSmall),
              subtitle: Text('1.0.0',
                  style: temaProvider.temaAtual.brightness == Brightness.light
                      ? temaClaro.textTheme.titleSmall
                      : temaEscuro.textTheme.titleSmall),
            ),
          ],
        ),
      ),
    );
  }
}
