import 'package:flutter/material.dart';
import 'package:leitor_qrcode/fun%C3%A7%C3%B5es/mudar_tema.dart';
import 'package:leitor_qrcode/styles/buttons.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:leitor_qrcode/styles/text.dart';
import 'package:leitor_qrcode/styles/themes.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class QrCodeContato extends StatefulWidget {
  const QrCodeContato({super.key});

  @override
  State<QrCodeContato> createState() => _QrCodeContatoState();
}

class _QrCodeContatoState extends State<QrCodeContato> {
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
          'Contato',
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
            height: 250,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 185,
                      child: TextField(
                        cursorColor: temaProvider.temaAtual.brightness ==
                                Brightness.light
                            ? MinhasCores.secundaria
                            : Colors.teal.shade300,
                        decoration: InputDecoration(
                          hintText: 'Nome',
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
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
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 185,
                      child: TextField(
                        cursorColor: temaProvider.temaAtual.brightness ==
                                Brightness.light
                            ? MinhasCores.secundaria
                            : Colors.teal.shade300,
                        decoration: InputDecoration(
                          hintText: 'Sobrenome',
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor:
                      temaProvider.temaAtual.brightness == Brightness.light
                          ? MinhasCores.secundaria
                          : Colors.teal.shade300,
                  decoration: InputDecoration(
                    hintText: 'Telefone',
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
                  height: 20,
                ),
                TextField(
                  cursorColor:
                      temaProvider.temaAtual.brightness == Brightness.light
                          ? MinhasCores.secundaria
                          : Colors.teal.shade300,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
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
