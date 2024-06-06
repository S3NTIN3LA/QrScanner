import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leitor_qrcode/fun%C3%A7%C3%B5es/mudar_tema.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:leitor_qrcode/styles/text.dart';
import 'package:leitor_qrcode/styles/themes.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class LeitorPage extends StatefulWidget {
  const LeitorPage({super.key});

  @override
  State<LeitorPage> createState() => _LeitorPageState();
}

class _LeitorPageState extends State<LeitorPage> {
  String conteudoQr = '';
  readQrCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#186F65",
      'Cancelar',
      true,
      ScanMode.QR,
    );
    setState(() {
      conteudoQr = code != '-1' ? code : 'Não foi possivel escanear :(';
    });
  }

  @override
  Widget build(BuildContext context) {
    final temaProvider = Provider.of<TemaProvider>(context);
    return Scaffold(
        backgroundColor: temaProvider.temaAtual.brightness == Brightness.light
            ? temaClaro.scaffoldBackgroundColor
            : temaEscuro.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: temaProvider.temaAtual.brightness == Brightness.light
              ? temaClaro.appBarTheme.backgroundColor
              : temaEscuro.appBarTheme.backgroundColor,
          leading: Icon(
            Icons.qr_code_scanner,
            color: temaProvider.temaAtual.brightness == Brightness.light
                ? MinhasCores.secundaria
                : Colors.teal[300],
          ),
          title: Text('Leitor',
              style: temaProvider.temaAtual.brightness == Brightness.light
                  ? temaClaro.textTheme.titleSmall
                  : temaEscuro.textTheme.titleSmall),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            height: conteudoQr != '' ? 360 : 240,
            child: Column(
              children: [
                if (conteudoQr != '')
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      color: MinhasCores.secundaria,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Toque para copiar:',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Vibration.vibrate(duration: 50);
                                final data = ClipboardData(text: conteudoQr);
                                Clipboard.setData(data);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(seconds: 1),
                                    backgroundColor: MinhasCores.secundaria,
                                    content: Row(
                                      children: [
                                        const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Copiado!',
                                          style: EstilosTexto.textoPaginas,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 60,
                                child: ListView(
                                  children: [
                                    Text(
                                      conteudoQr,
                                      maxLines: 3,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Card(
                  elevation: 5,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: const WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      minimumSize: const WidgetStatePropertyAll(Size(300, 140)),
                      backgroundColor: WidgetStatePropertyAll(
                          temaProvider.temaAtual.brightness == Brightness.light
                              ? MinhasCores.secundaria
                              : Colors.teal[300]),
                    ),
                    onPressed: () {
                      Vibration.vibrate(duration: 50);
                      readQrCode();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Escanear',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MinhasCores.secundaria,
                    ),
                    width: double.infinity,
                    child: IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            temaProvider.temaAtual.brightness ==
                                    Brightness.light
                                ? MinhasCores.secundaria
                                : Colors.teal[300]),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Vibration.vibrate(duration: 50);
                      },
                      icon: const Column(
                        children: [
                          Icon(
                            Icons.photo,
                            color: Colors.white,
                          ),
                          Text(
                            'Ler imagem',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
