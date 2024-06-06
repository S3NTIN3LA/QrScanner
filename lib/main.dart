import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leitor_qrcode/fun%C3%A7%C3%B5es/mudar_tema.dart';
import 'package:leitor_qrcode/navigation/bottom_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TemaProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomBar(),
    );
  }
}
