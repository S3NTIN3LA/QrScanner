import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leitor_qrcode/funcoes/leitor_imagem.dart';
import 'package:leitor_qrcode/funcoes/vibration_provider.dart';
import 'package:leitor_qrcode/historico_list.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class LeitorImagens extends StatefulWidget {
  final List<String> codigosEscaneados;
  const LeitorImagens({super.key, required this.codigosEscaneados});

  @override
  State<LeitorImagens> createState() => _LeitorImagensState();
}

class _LeitorImagensState extends State<LeitorImagens> {
  String _scanResult = '';

  void quandoForEscaneado(String codigoEscaneado) async {
    setState(() {
      widget.codigosEscaneados.add(codigoEscaneado);
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('codigosEscaneados', widget.codigosEscaneados);
  }

  Future<void> carregarHistorico() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      codigosEscaneados = prefs.getStringList('codigosEscaneados') ?? [];
    });
  }

  final QRImageScannerService _qrImageScannerService = QRImageScannerService();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      String scanResult =
          await _qrImageScannerService.scanQRFromImage(image.path);
      setState(() {
        _scanResult = scanResult;
        if (scanResult != 'QrCode não encontrado.') {
          quandoForEscaneado(_scanResult);
        }
      });
    }
  }

  void _mostrarOpcoes(BuildContext context, String url) {
    if (_scanResult != '' && _scanResult != 'QrCode não encontrado.') {
      Share.share(url);
    }
  }

  @override
  void initState() {
    super.initState();
    carregarHistorico();
  }

  @override
  Widget build(BuildContext context) {
    final vibracaoOn = context.watch<VibrationProvider>().vibracaoOn;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.photo),
        title: const Text('Imagens'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_scanResult != '')
                  Card(
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              if (vibracaoOn) {
                                Vibration.vibrate(duration: 50);
                              }
                              _mostrarOpcoes(context, _scanResult);
                            },
                            child: SizedBox(
                              height: 60,
                              child: ListView(
                                children: [
                                  Text(
                                    _scanResult,
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
                Card(
                  elevation: 5,
                  child: SizedBox(
                    height: 140,
                    child: TextButton(
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _pickImage();
                        if (vibracaoOn) {
                          Vibration.vibrate(duration: 50);
                        }
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.photo,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Ler imagem',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
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
