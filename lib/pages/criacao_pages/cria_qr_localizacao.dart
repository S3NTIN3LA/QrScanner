import 'package:flutter/material.dart';
import 'package:leitor_qrcode/funcoes/geo_localization.dart';
import 'package:leitor_qrcode/funcoes/vibration_provider.dart';
import 'package:provider/provider.dart';

class QrCodeLocalizacao extends StatefulWidget {
  const QrCodeLocalizacao({super.key});

  @override
  State<QrCodeLocalizacao> createState() => _QrCodeLocalizacaoState();
}

class _QrCodeLocalizacaoState extends State<QrCodeLocalizacao> {
  @override
  Widget build(BuildContext context) {
    //final vibrationOn = context.watch<VibrationProvider>().vibracaoOn;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localização'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => GeoLocalization(),
        child: Builder(builder: (context) {
          final local = context.watch<GeoLocalization>();
          String mensagem = local.erro == ''
              ? 'Latitude: ${local.lat} | Longitude: ${local.long}'
              : local.erro;

          return Center(
            child: Text(mensagem),
          );
        }),
      ),
    );
  }
}
