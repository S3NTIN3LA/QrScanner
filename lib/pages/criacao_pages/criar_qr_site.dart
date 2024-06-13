import 'package:flutter/material.dart';
import 'package:leitor_qrcode/styles/buttons.dart';
import 'package:leitor_qrcode/styles/text.dart';
import 'package:vibration/vibration.dart';

class QrCodeSite extends StatefulWidget {
  const QrCodeSite({super.key});

  @override
  State<QrCodeSite> createState() => _QrCodeSiteState();
}

class _QrCodeSiteState extends State<QrCodeSite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Site',
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
                    hintText: 'Coloque o endereço do site aqui',
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
