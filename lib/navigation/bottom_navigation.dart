import 'package:flutter/material.dart';
import 'package:leitor_qrcode/fun%C3%A7%C3%B5es/mudar_tema.dart';
import 'package:leitor_qrcode/pages/configuracao.dart';
import 'package:leitor_qrcode/pages/criar.dart';
import 'package:leitor_qrcode/pages/historico.dart';
import 'package:leitor_qrcode/pages/leitor.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:leitor_qrcode/styles/themes.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _pageSelected = 0;
  @override
  Widget build(BuildContext context) {
    final temaProvider = Provider.of<TemaProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageSelected,
        onTap: (opcao) {
          Vibration.vibrate(duration: 50);
          setState(() {
            _pageSelected = opcao;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: null,
            icon: Icon(Icons.qr_code_scanner_sharp),
            label: 'Leitor',
          ),
          BottomNavigationBarItem(
            backgroundColor: null,
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            backgroundColor: null,
            icon: Icon(
              Icons.add_box_outlined,
            ),
            label: 'Criar',
          ),
          BottomNavigationBarItem(
              backgroundColor: null,
              icon: Icon(Icons.settings_applications_sharp),
              label: 'Configurações'),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: temaProvider.temaAtual.brightness == Brightness.light
            ? temaClaro.bottomNavigationBarTheme.selectedItemColor
            : temaEscuro.bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: const Color(0xffB0A695),
        backgroundColor: temaProvider.temaAtual.brightness == Brightness.light
            ? temaClaro.bottomNavigationBarTheme.backgroundColor
            : temaEscuro.bottomNavigationBarTheme.backgroundColor,
      ),
      body: IndexedStack(
        index: _pageSelected,
        children: const [
          LeitorPage(),
          Historico(),
          Criar(),
          Configuracoes(),
        ],
      ),
    );
  }
}
