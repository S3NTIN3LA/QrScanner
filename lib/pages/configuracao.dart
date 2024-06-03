import 'package:flutter/material.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:vibration/vibration.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({super.key});

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  bool vibrar = true;
  bool abrirLinks = false;
  bool temaClaro = true;
  bool temaEscuro = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.background,
      appBar: AppBar(
        leading: const Icon(
          Icons.settings_applications_sharp,
          color: MinhasCores.bottomBar,
        ),
        title: const Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ListTile(
              title: Text(
                'Configurações do app',
                style: TextStyle(
                  color: MinhasCores.bottomBar,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.app_shortcut_rounded),
              title: const Text('Tema'),
              onTap: () {
                Vibration.vibrate(duration: 50);
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Temas:'),
                    content: SizedBox(
                      height: 120,
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.light_mode_outlined),
                            title: const Text('Claro'),
                            trailing: Switch(
                              activeColor: MinhasCores.bottomBar,
                              inactiveTrackColor: MinhasCores.background,
                              value: temaClaro,
                              onChanged: (value) {
                                Vibration.vibrate(duration: 50);
                                setState(() {
                                  temaClaro = !temaClaro;
                                  temaEscuro = !temaEscuro;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.dark_mode_outlined),
                            title: const Text('Escuro'),
                            trailing: Switch(
                              activeColor: MinhasCores.bottomBar,
                              inactiveTrackColor: MinhasCores.background,
                              value: temaEscuro,
                              onChanged: (value) {
                                Vibration.vibrate(duration: 50);
                                setState(() {
                                  temaClaro = !temaClaro;
                                  temaEscuro = !temaEscuro;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('Abrir links automaticamente'),
              trailing: Switch(
                activeColor: MinhasCores.bottomBar,
                inactiveTrackColor: MinhasCores.background,
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
              leading: const Icon(Icons.vibration),
              title: const Text('Vibrar'),
              trailing: Switch(
                activeColor: MinhasCores.bottomBar,
                inactiveTrackColor: MinhasCores.background,
                value: vibrar,
                onChanged: (value) {
                  Vibration.vibrate(duration: 50);
                  setState(() {
                    vibrar = !vibrar;
                  });
                },
              ),
            ),
            const ListTile(
              title: Text(
                'Sobre',
                style: TextStyle(
                  color: MinhasCores.bottomBar,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Introdução'),
              onTap: () {
                Vibration.vibrate(duration: 50);
              },
            ),
            ListTile(
              leading: const Icon(Icons.star_border),
              title: const Text('Avalie-nos'),
              onTap: () {
                Vibration.vibrate(duration: 50);
              },
            ),
            const ListTile(
              leading: Icon(Icons.system_update),
              title: Text('Versão'),
              subtitle: Text('1.0.0'),
            ),
          ],
        ),
      ),
    );
  }
}
