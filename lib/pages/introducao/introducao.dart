import 'package:flutter/material.dart';
import 'package:leitor_qrcode/funcoes/vibration_provider.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class Introducao extends StatelessWidget {
  const Introducao({super.key});

  @override
  Widget build(BuildContext context) {
    final vibrationOn = context.watch<VibrationProvider>().vibracaoOn;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.info_outline),
        title: const Text('Introdução'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/image_introduction.png',
              width: 200,
            ),
            const Text(
              'Descubra a facilidade de decodificar QR Codes e Códigos de Barras com o QrScanner, a escolha ideal para quem busca praticidade e eficiência. Com uma interface intuitiva e poderosas funcionalidades, este aplicativo coloca o poder de digitalização na palma da sua mão. Simplifique sua vida cotidiana, seja para verificar informações de produtos ou acessar conteúdos online rapidamente.',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
              onPressed: () {
                if (vibrationOn) {
                  Vibration.vibrate(duration: 50);
                }
                Navigator.of(context).pop();
              },
              child: const Text(
                'Voltar',
                style: TextStyle(color: MinhasCores.primaria),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
