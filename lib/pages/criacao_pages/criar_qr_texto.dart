import 'package:flutter/material.dart';
import 'package:leitor_qrcode/styles/buttons.dart';
import 'package:leitor_qrcode/styles/text.dart';
import 'package:vibration/vibration.dart';

class QrCodeTexto extends StatefulWidget {
  const QrCodeTexto({super.key});

  @override
  State<QrCodeTexto> createState() => _QrCodeTextoState();
}

class _QrCodeTextoState extends State<QrCodeTexto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Texto',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Coloque o texto desejado aqui',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: Botoes.botaoMenus,
                  onPressed: () {
                    Vibration.vibrate(duration: 50);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.qr_code_sharp,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Criar',
                        style: EstilosTexto.textoPaginas,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
