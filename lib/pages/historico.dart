import 'package:flutter/material.dart';
import 'package:leitor_qrcode/fun%C3%A7%C3%B5es/mudar_tema.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:leitor_qrcode/styles/themes.dart';
import 'package:provider/provider.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
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
          Icons.history,
          color: temaProvider.temaAtual.brightness == Brightness.light
              ? MinhasCores.secundaria
              : Colors.teal[300],
        ),
        title: Text('Histórico',
            style: temaProvider.temaAtual.brightness == Brightness.light
                ? temaClaro.textTheme.titleSmall
                : temaEscuro.textTheme.titleSmall),
      ),
      body: const Center(
        child: Text('Seu histórico de QrCodes criados aparecerá aqui.'),
      ),
    );
  }
}
