import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leitor_qrcode/funcoes/leitor_imagem.dart';
import 'package:leitor_qrcode/funcoes/vibration_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vibration/vibration.dart';

class LeitorImagens extends StatefulWidget {
  const LeitorImagens({super.key});

  @override
  State<LeitorImagens> createState() => _LeitorImagensState();
}

class _LeitorImagensState extends State<LeitorImagens> {
  String _scanResult = '';
  final QRImageScannerService _qrImageScannerService = QRImageScannerService();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      String scanResult =
          await _qrImageScannerService.scanQRFromImage(image.path);
      setState(() {
        _scanResult = scanResult;
      });
    }
  }

  void _mostrarOpcoes(BuildContext context, String url) {
    Share.share(url);
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
                          const Text(
                            'Toque:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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
