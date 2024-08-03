import 'package:flutter/material.dart';
import 'package:leitor_qrcode/styles/colors.dart';

class Introducao extends StatelessWidget {
  const Introducao({super.key});

  @override
  Widget build(BuildContext context) {
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
            Image.asset('assets/image_introduction.png'),
            const Text(
              'QrScanner é um app que visa agilizar e facilitar a leitura de qrcodes e códigos de barra no dia a dia.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
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
