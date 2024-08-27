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

class QrCodeEmail extends StatefulWidget {
  final List<String> codigosEscaneados;
  const QrCodeEmail({super.key, required this.codigosEscaneados});

  @override
  State<QrCodeEmail> createState() => _QrCodeEmailState();
}

class _QrCodeEmailState extends State<QrCodeEmail> {
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

  verificarConteudo() {
    if (_controller.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          content: Row(
            children: [
              Icon(Icons.error_outline_sharp),
              SizedBox(
                width: 15,
              ),
              Text('Este campo não pode estar vazio!')
            ],
          ),
        ),
      );
      setState(() {
        conteudoDigitado = '';
      });
    } else if (!_controller.text.contains("@")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          content: Row(
            children: [
              Icon(Icons.error_outline_sharp),
              SizedBox(
                width: 15,
              ),
              Text('Um e-mail precisa ter um "@"!')
            ],
          ),
        ),
      );
    } else {
      setState(() {
        conteudoDigitado = _controller.text;
        _controller.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final vibrationOn = context.watch<VibrationProvider>().vibracaoOn;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'E-mail',
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
                if (conteudoDigitado != '')
                  Text(
                    'E-mail: $conteudoDigitado',
                  ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Coloque o e-mail desejado aqui',
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
                    verificarConteudo();
                    if (conteudoDigitado != '') {
                      quandoForEscaneado(conteudoDigitado);
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
