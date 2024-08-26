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

  verificarConteudo() {
    bool telefonePreenchido = _controllerTelefone.text.isNotEmpty;
    bool telefoneValido =
        telefonePreenchido && _controllerTelefone.text.length <= 15;
    bool emailPreenchido = _controllerEmail.text.isNotEmpty;
    bool emailValido = emailPreenchido && _controllerEmail.text.contains("@");
    bool nomePreenchido = _controllerNome.text.isNotEmpty;

    if (nomePreenchido && telefoneValido && emailValido) {
      setState(() {
        conteudoDigitado.add('Nome: ${_controllerNome.text}');
        conteudoDigitado.add('Telefone: ${_controllerTelefone.text}');
        conteudoDigitado.add('E-mail: ${_controllerEmail.text}');
        _controllerTelefone.text = '';
        _controllerEmail.text = '';
        _controllerNome.text = '';
      });
    } else if (!nomePreenchido && telefoneValido && emailValido) {
      setState(() {
        conteudoDigitado.add('Telefone: ${_controllerTelefone.text}');
        conteudoDigitado.add('E-mail: ${_controllerEmail.text}');
        _controllerTelefone.text = '';
        _controllerEmail.text = '';
        _controllerNome.text = '';
      });
    } else if (nomePreenchido && telefoneValido) {
      setState(() {
        conteudoDigitado.add('Nome: ${_controllerNome.text}');
        conteudoDigitado.add('Telefone: ${_controllerTelefone.text}');
        _controllerTelefone.text = '';
        _controllerEmail.text = '';
        _controllerNome.text = '';
      });
    } else if (nomePreenchido && emailValido) {
      setState(() {
        conteudoDigitado.add('Nome: ${_controllerNome.text}');
        conteudoDigitado.add('E-mail: ${_controllerEmail.text}');
        _controllerTelefone.text = '';
        _controllerEmail.text = '';
        _controllerNome.text = '';
      });
    }

    if (!telefonePreenchido && !emailPreenchido) {
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
              Text('Telefone ou e-mail devem ser preenchidos!')
            ],
          ),
        ),
      );
    } else {
      if (telefonePreenchido && !telefoneValido) {
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
                Text(
                    'O número de telefone inserido contém\ndígitos demais para ser verdadeiro!'),
              ],
            ),
          ),
        );
        setState(() {
          _controllerTelefone.text = '';
          _controllerEmail.text = '';
          _controllerNome.text = '';
        });
      } /*else if (telefoneValido && emailValido) {
        setState(() {
          conteudoDigitado.add('Telefone: ${_controllerTelefone.text}');
          conteudoDigitado.add('E-mail: ${_controllerEmail.text}');
          _controllerTelefone.text = '';
          _controllerEmail.text = '';
          _controllerNome.text = '';
        });
      }
      else if (telefoneValido && !emailPreenchido) {
        setState(() {
          conteudoDigitado.add('Telefone: ${_controllerTelefone.text}');
          _controllerTelefone.text = '';
          _controllerEmail.text = '';
          _controllerNome.text = '';
        });
      }*/
    }
    if (emailPreenchido && !emailValido) {
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
              Text('Um e-mail deve ter um "@".')
            ],
          ),
        ),
      );
      setState(() {
        _controllerTelefone.text = '';
        _controllerEmail.text = '';
        _controllerNome.text = '';
      });
    } /* else if (emailValido && (telefoneValido || !telefonePreenchido)) {
      setState(() {
        conteudoDigitado.add('E-mail: ${_controllerEmail.text}');
        _controllerTelefone.text = '';
        _controllerEmail.text = '';
        _controllerNome.text = '';
      });
    }*/
  }

  @override
  Widget build(BuildContext context) {
    final vibrationOn = context.watch<VibrationProvider>().vibracaoOn;
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
                      version: 11,
                      size: 250,
                      data: conteudoDigitado.toString(),
                    ),
                  ),
                const SizedBox(
                  height: 17,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                      itemCount: conteudoDigitado.length,
                      itemBuilder: (context, index) {
                        return Text(conteudoDigitado[index]);
                      }),
                ),
                const SizedBox(
                  height: 17,
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
                    if (vibrationOn) {
                      Vibration.vibrate(duration: 50);
                    }
                    conteudoDigitado.clear();
                    verificarConteudo();
                    setState(() {
                      if (conteudoDigitado.isNotEmpty) {
                        quandoForEscaneado(conteudoDigitado.toString());
                      }
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
