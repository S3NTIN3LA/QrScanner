import 'package:flutter/material.dart';
import 'package:leitor_qrcode/funcoes/vibration_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
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

  void _mostrarOpcoes(BuildContext context, String url) {
    if (conteudoQr != '' && conteudoQr != 'Não foi possivel escanear :(') {
      Share.share(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final vibrationOn = context.watch<VibrationProvider>().vibracaoOn;
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.qr_code_scanner,
          ),
          title: const Text(
            'Leitor',
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (conteudoQr != '')
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.touch_app_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Compartilhar',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {
                                if (vibrationOn) {
                                  Vibration.vibrate(duration: 50);
                                }
                                _mostrarOpcoes(context, conteudoQr);
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
                    style: const ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      minimumSize: WidgetStatePropertyAll(Size(300, 140)),
                    ),
                    onPressed: () {
                      if (vibrationOn) {
                        Vibration.vibrate(duration: 50);
                      }
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
              ],
            ),
          ),
        ));
  }
}
