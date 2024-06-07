import 'package:flutter/material.dart';
import 'package:leitor_qrcode/fun%C3%A7%C3%B5es/mudar_tema.dart';
import 'package:leitor_qrcode/styles/buttons.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:leitor_qrcode/styles/text.dart';
import 'package:leitor_qrcode/styles/themes.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class QrCodeTexto extends StatefulWidget {
  const QrCodeTexto({super.key});

  @override
  State<QrCodeTexto> createState() => _QrCodeTextoState();
}

class _QrCodeTextoState extends State<QrCodeTexto> {
  @override
  Widget build(BuildContext context) {
    final temaProvider = Provider.of<TemaProvider>(context);
    return Scaffold(
      backgroundColor: temaProvider.temaAtual.brightness == Brightness.light
          ? temaClaro.scaffoldBackgroundColor
          : temaEscuro.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: temaProvider.temaAtual.brightness == Brightness.light
              ? MinhasCores.secundaria
              : Colors.teal[300],
        ),
        backgroundColor: temaProvider.temaAtual.brightness == Brightness.light
            ? temaClaro.appBarTheme.backgroundColor
            : temaEscuro.appBarTheme.backgroundColor,
        title: Text(
          'Texto',
          style: temaProvider.temaAtual.brightness == Brightness.light
              ? temaClaro.textTheme.titleSmall
              : temaEscuro.textTheme.titleSmall,
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
                TextField(
                  cursorColor:
                      temaProvider.temaAtual.brightness == Brightness.light
                          ? MinhasCores.secundaria
                          : Colors.teal.shade300,
                  decoration: InputDecoration(
                    hintText: 'Coloque o texto desejado aqui',
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: temaProvider.temaAtual.brightness ==
                                  Brightness.light
                              ? MinhasCores.secundaria
                              : Colors.teal.shade300,
                          width: 3),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: temaProvider.temaAtual.brightness == Brightness.light
                      ? Botoes.botaoMenusLight
                      : Botoes.botaoMenusDark,
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
