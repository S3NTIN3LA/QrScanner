import 'package:flutter/material.dart';
import 'package:leitor_qrcode/historico_list.dart';
import 'package:leitor_qrcode/styles/buttons.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:leitor_qrcode/styles/text.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class QrCodeContato extends StatefulWidget {
  final List<String> codigosEscaneados;
  const QrCodeContato({super.key, required this.codigosEscaneados});

  @override
  State<QrCodeContato> createState() => _QrCodeContatoState();
}

class _QrCodeContatoState extends State<QrCodeContato> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerTelefone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();

  List<String> conteudoDigitado = [];

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Contato',
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                if (conteudoDigitado.isEmpty == false)
                  Align(
                    alignment: Alignment.center,
                    child: QrImageView(
                      backgroundColor: MinhasCores.primaria,
                      errorCorrectionLevel: QrErrorCorrectLevel.H,
                      gapless: true,
                      version: 8,
                      size: 250,
                      data: conteudoDigitado.toString(),
                    ),
                  ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: _controllerNome,
                  cursorColor: Colors.teal,
                  decoration: const InputDecoration(
                    hintText: 'Nome',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: _controllerTelefone,
                  decoration: const InputDecoration(
                    hintText: 'Telefone',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _controllerEmail,
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
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
                    setState(() {
                      conteudoDigitado.add(_controllerNome.text);
                      conteudoDigitado.add(_controllerTelefone.text);
                      conteudoDigitado.add(_controllerEmail.text);
                      quandoForEscaneado(conteudoDigitado.toString());
                      _controllerNome.text = '';
                      _controllerTelefone.text = '';
                      _controllerEmail.text = '';
                    });
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
