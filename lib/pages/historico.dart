import 'package:flutter/material.dart';
import 'package:leitor_qrcode/funcoes/vibration_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class Historico extends StatefulWidget {
  final List<String> codigosEscaneados;

  const Historico({super.key, required this.codigosEscaneados});

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  @override
  Widget build(BuildContext context) {
    final vibrationOn = context.watch<VibrationProvider>().vibracaoOn;
    List<String> listaDeCodigos = List.from(widget.codigosEscaneados.reversed);

    void removerDoHistorico(int index) async {
      setState(() {
        widget.codigosEscaneados.removeAt(index);
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('codigosEscaneados', widget.codigosEscaneados);
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.history),
        title: const Text('Histórico'),
      ),
      body: listaDeCodigos.isEmpty
          ? const Center(
              child: Text('Não há dados no histórico'),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: listaDeCodigos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.qr_code_rounded),
                    title: Text(
                      listaDeCodigos[index],
                      maxLines: 2,
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        if (vibrationOn) {
                          Vibration.vibrate(duration: 50);
                        }
                        removerDoHistorico(listaDeCodigos.length - 1 - index);
                      },
                    ),
                    onTap: () {
                      if (vibrationOn) {
                        Vibration.vibrate(duration: 50);
                      }
                      Share.share(listaDeCodigos[index]);
                    },
                  );
                },
              ),
            ),
    );
  }
}
