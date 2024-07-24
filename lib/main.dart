import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leitor_qrcode/funcoes/mudar_tema.dart';
import 'package:leitor_qrcode/funcoes/vibration_provider.dart';
import 'package:leitor_qrcode/navigation/bottom_navigation.dart';
import 'package:leitor_qrcode/styles/themes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final temaProvider = ThemeProvider(temaClaro);
  await temaProvider.carregarTema();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => temaProvider),
        ChangeNotifierProvider(create: (_) => VibrationProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final temaProvider = Provider.of<ThemeProvider>(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      theme: temaProvider.themeData,
      debugShowCheckedModeBanner: false,
      home: const BottomBar(),
    );
  }
}
