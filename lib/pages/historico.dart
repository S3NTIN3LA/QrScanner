import 'package:flutter/material.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.history,
        ),
        title: const Text(
          'Histórico',
        ),
      ),
      body: const Center(
        child: Text('Seu histórico de QrCodes criados aparecerá aqui.'),
      ),
    );
  }
}
