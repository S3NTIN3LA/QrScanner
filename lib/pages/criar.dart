import 'package:flutter/material.dart';
import 'package:leitor_qrcode/funcoes/vibration_provider.dart';
import 'package:leitor_qrcode/historico_list.dart';
import 'package:leitor_qrcode/navigation/navegacao_paginas.dart';
import 'package:leitor_qrcode/pages/criacao_pages/cria_qr_localizacao.dart';
import 'package:leitor_qrcode/pages/criacao_pages/criar_qr_contato.dart';
import 'package:leitor_qrcode/pages/criacao_pages/criar_qr_email.dart';
import 'package:leitor_qrcode/pages/criacao_pages/criar_qr_site.dart';
import 'package:leitor_qrcode/pages/criacao_pages/criar_qr_texto.dart';
import 'package:leitor_qrcode/styles/buttons.dart';
import 'package:leitor_qrcode/styles/text.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class Criar extends StatefulWidget {
  const Criar({super.key});

  @override
  State<Criar> createState() => _CriarState();
}

class _CriarState extends State<Criar> {
  @override
  Widget build(BuildContext context) {
    final vibracaoOn = context.watch<VibrationProvider>().vibracaoOn;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.add_box_outlined,
        ),
        title: const Text(
          'Criar',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ElevatedButton(
              style: Botoes.botaoMenus,
              child: Row(
                children: [
                  const Icon(
                    Icons.language_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Site',
                    style: EstilosTexto.textoPaginas,
                  ),
                ],
              ),
              onPressed: () {
                if (vibracaoOn) {
                  Vibration.vibrate(duration: 50);
                }
                navegar(
                    QrCodeSite(codigosEscaneados: codigosEscaneados), context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: Botoes.botaoMenus,
              child: Row(
                children: [
                  const Icon(
                    Icons.perm_contact_cal_rounded,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Contatos',
                    style: EstilosTexto.textoPaginas,
                  ),
                ],
              ),
              onPressed: () {
                if (vibracaoOn) {
                  Vibration.vibrate(duration: 50);
                }
                navegar(QrCodeContato(codigosEscaneados: codigosEscaneados),
                    context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: Botoes.botaoMenus,
              child: Row(
                children: [
                  const Icon(
                    Icons.wifi,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Wi-fi',
                    style: EstilosTexto.textoPaginas,
                  ),
                ],
              ),
              onPressed: () {
                if (vibracaoOn) {
                  Vibration.vibrate(duration: 50);
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: Botoes.botaoMenus,
              child: Row(
                children: [
                  const Icon(
                    Icons.fmd_good_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Localização',
                    style: EstilosTexto.textoPaginas,
                  ),
                ],
              ),
              onPressed: () {
                if (vibracaoOn) {
                  Vibration.vibrate(duration: 50);
                }
                navegar(
                    QrCodeLocalizacao(
                      codigosEscaneados: codigosEscaneados,
                    ),
                    context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: Botoes.botaoMenus,
              child: Row(
                children: [
                  const Icon(
                    Icons.text_snippet_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Texto',
                    style: EstilosTexto.textoPaginas,
                  ),
                ],
              ),
              onPressed: () {
                if (vibracaoOn) {
                  Vibration.vibrate(duration: 50);
                }
                navegar(
                    QrCodeTexto(codigosEscaneados: codigosEscaneados), context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: Botoes.botaoMenus,
              child: Row(
                children: [
                  const Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'E-mail',
                    style: EstilosTexto.textoPaginas,
                  ),
                ],
              ),
              onPressed: () {
                if (vibracaoOn) {
                  Vibration.vibrate(duration: 50);
                }
                navegar(
                    QrCodeEmail(codigosEscaneados: codigosEscaneados), context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
