import 'package:flutter/material.dart';
import 'package:leitor_qrcode/funcoes/vibration_provider.dart';
import 'package:leitor_qrcode/historico_list.dart';
import 'package:leitor_qrcode/styles/buttons.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:leitor_qrcode/styles/text.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class QrCodeTexto extends StatefulWidget {
  final List<String> codigosEscaneados;
  const QrCodeTexto({super.key, required this.codigosEscaneados});

  @override
  State<QrCodeTexto> createState() => _QrCodeTextoState();
}

class _QrCodeTextoState extends State<QrCodeTexto> {
  final TextEditingController _controller = TextEditingController();
  String conteudoDigitado = '';

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

  @override
  Widget build(BuildContext context) {
    final vibrationOn = context.watch<VibrationProvider>().vibracaoOn;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Texto',
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                if (conteudoDigitado != '')
                  Align(
                    alignment: Alignment.center,
                    child: QrImageView(
                      backgroundColor: MinhasCores.primaria,
                      errorCorrectionLevel: QrErrorCorrectLevel.H,
                      gapless: true,
                      version: 6,
                      size: 250,
                      data: conteudoDigitado,
                    ),
                  ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
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
                    if (vibrationOn) {
                      Vibration.vibrate(duration: 50);
                    }
                    if (_controller.text != '') {
                      setState(() {
                        conteudoDigitado = _controller.text;
                        quandoForEscaneado(conteudoDigitado);
                        _controller.text = '';
                      });
                    }
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
