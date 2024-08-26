import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:leitor_qrcode/funcoes/geo_localization.dart';
import 'package:leitor_qrcode/funcoes/vibration_provider.dart';
import 'package:leitor_qrcode/historico_list.dart';
import 'package:leitor_qrcode/styles/buttons.dart';
import 'package:leitor_qrcode/styles/colors.dart';
import 'package:leitor_qrcode/styles/text.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class QrCodeLocalizacao extends StatefulWidget {
  final List<String> codigosEscaneados;
  const QrCodeLocalizacao({super.key, required this.codigosEscaneados});

  @override
  State<QrCodeLocalizacao> createState() => _QrCodeLocalizacaoState();
}

class _QrCodeLocalizacaoState extends State<QrCodeLocalizacao> {
  String conteudoAGerar = '';

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
    final vibrationOn = context.watch<VibrationProvider>().vibracaoOn;
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (conteudoAGerar != '')
                  Align(
                    alignment: Alignment.center,
                    child: QrImageView(
                      backgroundColor: MinhasCores.primaria,
                      errorCorrectionLevel: QrErrorCorrectLevel.H,
                      gapless: true,
                      version: 8,
                      size: 250,
                      data: conteudoAGerar,
                    ),
                  ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: SelectableText(conteudoAGerar),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 200,
                  child: GoogleMap(
                    zoomControlsEnabled: true,
                    rotateGesturesEnabled: true,
                    scrollGesturesEnabled: true,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    initialCameraPosition: CameraPosition(
                      zoom: 18,
                      target: LatLng(local.lat, local.long),
                    ),
                    onMapCreated: local.onMapCreated,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: Botoes.botaoMenus,
                  onPressed: () {
                    if (vibrationOn) {
                      Vibration.vibrate(duration: 50);
                    }
                    if (local.erro == '') {
                      setState(() {
                        conteudoAGerar = mensagem;
                        quandoForEscaneado(conteudoAGerar);
                      });
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
          );
        }),
      ),
    );
  }
}
