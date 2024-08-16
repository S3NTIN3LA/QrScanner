import 'package:flutter/material.dart';
import 'package:leitor_qrcode/funcoes/vibration_provider.dart';
import 'package:leitor_qrcode/historico_list.dart';
import 'package:leitor_qrcode/pages/configuracao.dart';
import 'package:leitor_qrcode/pages/criar.dart';
import 'package:leitor_qrcode/pages/historico.dart';
import 'package:leitor_qrcode/pages/leitor_camera.dart';
import 'package:leitor_qrcode/pages/leitor_imagens.dart';
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
    final vibracaoOn = context.watch<VibrationProvider>().vibracaoOn;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageSelected,
        onTap: (opcao) {
          if (vibracaoOn) {
            Vibration.vibrate(duration: 50);
          }
          setState(() {
            _pageSelected = opcao;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: null,
            icon: Icon(Icons.qr_code_scanner_sharp),
            label: 'Câmera',
          ),
          BottomNavigationBarItem(
            backgroundColor: null,
            icon: Icon(Icons.image_search),
            label: 'Ler imagem',
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
        unselectedItemColor: const Color(0xffB0A695),
      ),
      body: IndexedStack(
        index: _pageSelected,
        children: [
          LeitorPage(
            codigosEscaneados: codigosEscaneados,
          ),
          LeitorImagens(
            codigosEscaneados: codigosEscaneados,
          ),
          Historico(
            codigosEscaneados: codigosEscaneados,
          ),
          const Criar(),
          const Configuracoes(),
        ],
      ),
    );
  }
}
