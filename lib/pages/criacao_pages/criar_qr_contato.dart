import 'package:flutter/material.dart';
import 'package:leitor_qrcode/styles/buttons.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:leitor_qrcode/styles/text.dart';
import 'package:vibration/vibration.dart';

class QrCodeContato extends StatefulWidget {
  const QrCodeContato({super.key});

  @override
  State<QrCodeContato> createState() => _QrCodeContatoState();
}

class _QrCodeContatoState extends State<QrCodeContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.primaria,
      appBar: AppBar(
        title: const Text('Contato'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: 250,
            child: Column(
              children: [
                const Row(
                  children: [
                    SizedBox(
                      width: 185,
                      child: TextField(
                        cursorColor: MinhasCores.secundaria,
                        decoration: InputDecoration(
                          hintText: 'Nome',
                          hintStyle: TextStyle(fontWeight: FontWeight.normal),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MinhasCores.secundaria, width: 3),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 185,
                      child: TextField(
                        cursorColor: MinhasCores.secundaria,
                        decoration: InputDecoration(
                          hintText: 'Sobrenome',
                          hintStyle: TextStyle(fontWeight: FontWeight.normal),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: MinhasCores.secundaria, width: 3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  cursorColor: MinhasCores.secundaria,
                  decoration: InputDecoration(
                    hintText: 'Telefone',
                    hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: MinhasCores.secundaria, width: 3),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  cursorColor: MinhasCores.secundaria,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: MinhasCores.secundaria, width: 3),
                    ),
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
