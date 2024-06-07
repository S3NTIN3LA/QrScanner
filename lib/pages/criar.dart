import 'package:flutter/material.dart';
import 'package:leitor_qrcode/fun%C3%A7%C3%B5es/mudar_tema.dart';
import 'package:leitor_qrcode/pages/criacao_pages/criar_qr_contato.dart';
import 'package:leitor_qrcode/pages/criacao_pages/criar_qr_site.dart';
import 'package:leitor_qrcode/pages/criacao_pages/criar_qr_texto.dart';
import 'package:leitor_qrcode/styles/buttons.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:leitor_qrcode/styles/text.dart';
import 'package:leitor_qrcode/styles/themes.dart';
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
    final temaProvider = Provider.of<TemaProvider>(context);
    return Scaffold(
      backgroundColor: temaProvider.temaAtual.brightness == Brightness.light
          ? MinhasCores.primaria
          : temaEscuro.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: temaProvider.temaAtual.brightness == Brightness.light
            ? temaClaro.appBarTheme.backgroundColor
            : temaEscuro.appBarTheme.backgroundColor,
        leading: Icon(
          Icons.add_box_outlined,
          color: temaProvider.temaAtual.brightness == Brightness.light
              ? MinhasCores.secundaria
              : Colors.teal[300],
        ),
        title: Text('Criar',
            style: temaProvider.temaAtual.brightness == Brightness.light
                ? temaClaro.textTheme.titleSmall
                : temaEscuro.textTheme.titleSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              style: temaProvider.temaAtual.brightness == Brightness.light
                  ? Botoes.botaoMenusLight
                  : Botoes.botaoMenusDark,
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
                Vibration.vibrate(duration: 50);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const QrCodeSite(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: temaProvider.temaAtual.brightness == Brightness.light
                  ? Botoes.botaoMenusLight
                  : Botoes.botaoMenusDark,
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
                Vibration.vibrate(duration: 50);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const QrCodeContato(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: temaProvider.temaAtual.brightness == Brightness.light
                  ? Botoes.botaoMenusLight
                  : Botoes.botaoMenusDark,
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
                Vibration.vibrate(duration: 50);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: temaProvider.temaAtual.brightness == Brightness.light
                  ? Botoes.botaoMenusLight
                  : Botoes.botaoMenusDark,
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
                Vibration.vibrate(duration: 50);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: temaProvider.temaAtual.brightness == Brightness.light
                  ? Botoes.botaoMenusLight
                  : Botoes.botaoMenusDark,
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
                Vibration.vibrate(duration: 50);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const QrCodeTexto(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: temaProvider.temaAtual.brightness == Brightness.light
                  ? Botoes.botaoMenusLight
                  : Botoes.botaoMenusDark,
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
                Vibration.vibrate(duration: 50);
              },
            ),
          ],
        ),
      ),
    );
  }
}
