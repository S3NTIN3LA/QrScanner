import 'package:flutter/material.dart';
import 'package:leitor_qrcode/styles/colors.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MinhasCores.background,
      appBar: AppBar(
        leading: const Icon(
          Icons.history,
          color: MinhasCores.bottomBar,
        ),
        title: const Text('Histórico'),
      ),
      body: const Center(
        child: Text('Seu histórico de QrCodes criados aparecerá aqui.'),
      ),
    );
  }
}
